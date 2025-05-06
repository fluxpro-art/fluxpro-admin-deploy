@echo off
echo ===== Iniciando processo de deploy do FluxPro =====

:: Etapa 1 - Instalar dependências
echo Instalando dependências com npm install...
call npm install
if errorlevel 1 (
    echo [ERRO] Falha ao instalar dependências. Abortando.
    pause
    exit /b 1
)

:: Etapa 2 - Build do projeto
echo Gerando build do projeto com npm run build...
call npm run build
if errorlevel 1 (
    echo [ERRO] Falha ao gerar o build. Abortando.
    pause
    exit /b 1
)

:: Etapa 3 - Deploy com Vercel
echo Realizando deploy com Vercel...
call vercel --prod
if errorlevel 1 (
    echo [ERRO] Falha no deploy. Verifique a configuração do projeto.
    pause
    exit /b 1
)

echo ===== Deploy concluído com sucesso! =====
pause