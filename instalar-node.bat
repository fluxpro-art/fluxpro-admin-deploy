@echo off
setlocal
echo Baixando instalador do Node.js LTS (v22.15.0)...

:: Cria uma pasta temporária
set "tempdir=%~dp0temp-node"
mkdir "%tempdir%"
cd /d "%tempdir%"

:: Baixa o instalador direto do site oficial
curl -L -o node-v22.15.0-x64.msi https://nodejs.org/dist/v22.15.0/node-v22.15.0-x64.msi

:: Executa o instalador em modo silencioso
echo Instalando Node.js...
msiexec /i node-v22.15.0-x64.msi /quiet

:: Aguarda a instalação
timeout /t 5 /nobreak >nul

:: Testa as versões
echo Verificando instalação...
where node >nul 2>nul
if errorlevel 1 (
    echo ERRO: Node.js não foi instalado corretamente.
    pause
    exit /b 1
)

node -v
npm -v
npx -v

:: Limpeza opcional
cd ..
rd /s /q "%tempdir%"

echo Instalação concluída com sucesso!
pause
endlocal