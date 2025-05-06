@echo off
setlocal enabledelayedexpansion

:: Caminhos
set LOGFILE=%~dp0deploy-log.txt
set SMTP_SCRIPT=%~dp0send-log-email.ps1

:: Início
echo ------------------------------ >> "%LOGFILE%"
echo Início do Deploy: %date% %time% >> "%LOGFILE%"

:: Força execução como admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title Deploy FluxPro - Admin
cd /d "%~dp0"

echo Instalando dependências... >> "%LOGFILE%"
call npm install >> "%LOGFILE%" 2>&1

echo Limpando build anterior... >> "%LOGFILE%"
rmdir /s /q dist >> "%LOGFILE%" 2>&1

echo Gerando nova build... >> "%LOGFILE%"
call npm run build >> "%LOGFILE%" 2>&1

echo Realizando deploy via Vercel... >> "%LOGFILE%"
call vercel --prod >> "%LOGFILE%" 2>&1

:: Envio do log por email
powershell -ExecutionPolicy Bypass -File "%SMTP_SCRIPT%"

echo Deploy finalizado em %date% %time% >> "%LOGFILE%"
echo ------------------------------ >> "%LOGFILE%"
pause
