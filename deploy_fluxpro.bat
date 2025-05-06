
@echo off
echo === Iniciando Deploy do FluxPro ===

REM Configurações iniciais (só na primeira vez)
git config --global user.name "Daniel Campos"
git config --global user.email "anielcampos991@gmail.com"

REM Caminho do projeto
cd /d "C:\Users\silve\OneDrive\Área de Trabalho\Nova pasta\fluxpro-admin-deploy"

REM Inicializa repositório Git
git init

REM Adiciona arquivos
git add .

REM Commit inicial
git commit -m "Deploy inicial do painel FluxPro"

REM Cria branch principal
git branch -M main

REM Adiciona repositório remoto
git remote add origin https://github.com/fluxpro-art/fluxpro-admin-deploy.git

REM Push para o GitHub
git push -u origin main

echo === Deploy finalizado com sucesso! ===
pause
