
# Script: CorrigirErroNPM.ps1
Write-Host "Ajustando política de execução para RemoteSigned..."
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force

Write-Host "`nPolítica de execução ajustada com sucesso!"
Write-Host "Você já pode usar o comando 'npm' normalmente no terminal."
Pause
