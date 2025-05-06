@echo off
title Iniciando FluxPro Admin...
echo ========================================
echo  INICIANDO PROJETO FLUXPRO - ADMIN PANEL
echo ========================================
cd /d C:\Users\silve\Downloads\fluxpro-admin\fluxpro-panel\fluxpro-admin

echo Instalando dependências...
call npm install

echo Verificando se tailwindcss está presente...
call npm list tailwindcss >nul 2>&1
if %errorlevel% neq 0 (
    echo Instalando TailwindCSS...
    call npm install -D tailwindcss
    call npx tailwindcss init -p
)

echo Iniciando o servidor local...
call npm run dev

pause