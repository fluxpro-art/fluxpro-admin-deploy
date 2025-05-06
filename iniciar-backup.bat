@echo off
title Iniciar Backup Backend

echo.
echo Iniciando push de backup do backend...
echo.

REM Verifica se o Git está instalado
git --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo [ERRO] Git não está instalado ou não está no PATH do sistema.
    echo Por favor, instale o Git: https://git-scm.com/download/win
    pause
    exit /b
)

REM Verifica se estamos dentro de um repositório Git
git rev-parse --is-inside-work-tree >nul 2>&1
IF ERRORLEVEL 1 (
    echo [ERRO] Este diretório não é um repositório Git.
    echo Certifique-se de que o backend esteja versionado corretamente.
    pause
    exit /b
)

REM Executa os comandos de push
git add .
git commit -m "Backup automático via script"
git push

IF ERRORLEVEL 1 (
    echo [ERRO] Falha ao fazer push. Verifique sua conexão ou permissões.
) ELSE (
    echo [SUCESSO] Backup enviado com sucesso para o repositório remoto.
)

pause