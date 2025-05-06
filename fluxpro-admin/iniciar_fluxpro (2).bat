@echo off
title Iniciando FluxPro Painel
echo Verificando Node.js...

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ERRO: Node.js não está instalado.
    echo Baixe em: https://nodejs.org
    pause
    exit /b
)

echo Iniciando instalação das dependências...
cd /d "%~dp0"
call npm install

echo Inicializando o painel...
call npm start

pause
