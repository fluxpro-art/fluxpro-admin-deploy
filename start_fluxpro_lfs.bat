@echo off
echo == Iniciando Deploy do FluxPro com suporte a Git LFS ==
IF NOT EXIST ".git" (
    echo Repositorio Git nao encontrado. Abortando.
    pause
    exit /b
)
echo Instalando Git LFS...
git lfs install

echo Adicionando arquivos grandes ao Git LFS...
git lfs track "*.exe"
git lfs track "*.msi"

echo Atualizando .gitattributes...
git add .gitattributes

echo Adicionando arquivos ao commit...
git add .
git commit -m "Deploy com Git LFS habilitado"

echo Enviando para o GitHub...
git push origin main

echo Deploy com LFS finalizado.
pause
