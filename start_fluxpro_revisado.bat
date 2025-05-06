@echo off
echo == Iniciando Deploy do FluxPro ==

REM Verifica se é um repositório Git
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Esta pasta nao é um repositório Git.
    echo Inicie com: git init && git remote add origin <URL>
    goto fim
)

REM Atualiza .gitignore apenas se houver mudanças
git status --porcelain .gitignore | findstr . >nul
if not errorlevel 1 (
    echo Atualizando .gitignore...
    git add .gitignore
    git commit -m "Atualizando .gitignore"
)

REM Faz push para o origin
echo Enviando para o GitHub...
git push origin main

if errorlevel 1 (
    echo [ERRO] Falha no push. Verifique sua conexão ou permissões.
    goto fim
)

echo Deploy finalizado com sucesso!

:fim
pause
