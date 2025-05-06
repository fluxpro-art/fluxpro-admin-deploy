@echo off
chcp 65001 >nul
cls

echo ===========================================
echo      DEPLOY AUTOMÁTICO – FLUXPRO
echo ===========================================
echo.
echo Escolha o ambiente para deploy:
echo [1] Produção
echo [2] Homologação
echo [3] Staging
echo.

set /p envChoice=Digite o número do ambiente: 

if "%envChoice%"=="1" (
    echo Ambiente selecionado: PRODUÇÃO
    set ENV_FILE=.env.production
) else if "%envChoice%"=="2" (
    echo Ambiente selecionado: HOMOLOGAÇÃO
    set ENV_FILE=.env.homologation
) else if "%envChoice%"=="3" (
    echo Ambiente selecionado: STAGING
    set ENV_FILE=.env.staging
) else (
    echo Ambiente inválido. Encerrando...
    pause
    exit /b
)

echo.
echo [1/5] Copiando arquivo de ambiente: %ENV_FILE%
copy /Y "%ENV_FILE%" .env >nul

echo [2/5] Instalando dependências...
call npm install

echo [3/5] Gerando build de produção...
call npm run build

echo [4/5] Deploy via Vercel CLI...
call vercel --prod --confirm

echo [5/5] Limpeza e finalização...
del .env

echo.
echo ===========================================
echo      DEPLOY CONCLUÍDO COM SUCESSO!
echo ===========================================
pause
