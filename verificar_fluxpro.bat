
@echo off
setlocal enabledelayedexpansion

:: Caminho base do projeto
set "PROJETO=%cd%"
set "LOG=%PROJETO%\log_verificacao.txt"
echo Iniciando verificação do projeto FluxPro... > "%LOG%"

:: Criar diretórios se não existirem
for %%D in (frontend backend public assets config) do (
    if not exist "%PROJETO%\%%D" (
        echo Criando pasta %%D...
        mkdir "%PROJETO%\%%D"
        echo [+] Criada pasta %%D >> "%LOG%"
    )
)

:: Mover arquivos conhecidos
if exist "%PROJETO%\index.html" (
    move "%PROJETO%\index.html" "%PROJETO%\frontend\public\index.html"
    echo [+] index.html movido para frontend/public >> "%LOG%"
)

if exist "%PROJETO%\.env" (
    move "%PROJETO%\.env" "%PROJETO%\backend\.env"
    echo [+] .env movido para backend >> "%LOG%"
)

if exist "%PROJETO%\package.json" (
    move "%PROJETO%\package.json" "%PROJETO%\frontend\package.json"
    echo [+] package.json movido para frontend >> "%LOG%"
)

:: Verificações básicas
echo Verificando estrutura... >> "%LOG%"
for %%F in (index.html package.json .env) do (
    if not exist "%PROJETO%\frontend\%%F" (
        echo [ERRO] %%F não encontrado em frontend >> "%LOG%"
    )
)

:: Finalização
echo Verificação concluída. Verifique o arquivo de log: %LOG%
pause
