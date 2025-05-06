@echo off
echo == Iniciando Deploy do FluxPro ==

:: Caminho base do projeto
cd /d "%~dp0"

:: Verificar se temp-node existe antes de tentar algo
IF EXIST temp-node (
    echo Removendo arquivos grandes do versionamento...
    git rm --cached -r temp-node
)

:: Atualizando .gitignore
echo Atualizando .gitignore...
echo temp-node/>> .gitignore
echo *.msi>> .gitignore

:: Commit e push
echo Realizando commit...
git add .
git commit -m "Limpeza de arquivos grandes e atualizacao do .gitignore"

echo Enviando para o GitHub...
git push origin main

echo Deploy finalizado com sucesso!
pause
