@echo off
cd /d "%~dp0"
echo Iniciando o projeto FluxPro...
call npm install
call npm run dev
pause
