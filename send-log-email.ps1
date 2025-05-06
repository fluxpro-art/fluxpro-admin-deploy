$from = "danielcampos991@gmail.com"
$to = "danielcampos991@gmail.com"
$subject = "Log de Deploy FluxPro"
$body = "Segue em anexo o log do último deploy realizado."
$attachment = "$PSScriptRoot\deploy-log.txt"
$smtpServer = "smtp.gmail.com"
$smtpPort = 587

# ATENÇÃO: Crie uma senha de app no Gmail e substitua abaixo
$securePassword = ConvertTo-SecureString "SENHA-DE-APP-AQUI" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($from, $securePassword)

Send-MailMessage -From $from -To $to -Subject $subject -Body $body -SmtpServer $smtpServer -Port $smtpPort -UseSsl -Credential $cred -Attachments $attachment
