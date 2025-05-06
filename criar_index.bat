@echo off
REM Criar pasta public se não existir
if not exist public (
    mkdir public
)

REM Criar arquivo index.html básico
echo ^<!DOCTYPE html^> > public\index.html
echo ^<html lang="pt-BR"^> >> public\index.html
echo ^<head^> >> public\index.html
echo     ^<meta charset="UTF-8" /^> >> public\index.html
echo     ^<link rel="icon" href="%%PUBLIC_URL%%/favicon.ico" /^> >> public\index.html
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^> >> public\index.html
echo     ^<title^>FluxPro Admin^</title^> >> public\index.html
echo ^</head^> >> public\index.html
echo ^<body^> >> public\index.html
echo     ^<noscript^>Você precisa habilitar o JavaScript para rodar o app.^</noscript^> >> public\index.html
echo     ^<div id="root"^>^</div^> >> public\index.html
echo ^</body^> >> public\index.html
echo ^</html^> >> public\index.html

echo.
echo index.html criado com sucesso em /public!
pause
