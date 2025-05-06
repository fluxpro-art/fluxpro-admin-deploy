@echo off
cls
echo ===== DEPLOY AUTOMATICO FLUXPRO VIA VERCEL =====

cd /d "C:\Users\silve\OneDrive\Área de Trabalho\Nova pasta\fluxpro-admin"

echo.
echo [1/4] Instalando Vercel CLI globalmente...
npm install -g vercel

echo.
echo [2/4] Fazendo login na Vercel...
vercel login danielcampos.dev@gmail.com

echo.
echo [3/4] Executando deploy...
vercel --prod --name fluxpro-admin-v2

echo.
echo [4/4] Deploy concluído. Verifique a URL gerada.

pause
