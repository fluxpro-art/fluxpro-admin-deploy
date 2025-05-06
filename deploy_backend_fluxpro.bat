@echo off
cd /d "%~dp0"
echo Realizando push do backend...
git add .
git commit -m "Atualização backend automática"
git push origin main
echo Push enviado. Atualizando API no Railway...
railway up
pause