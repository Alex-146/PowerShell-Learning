
#region Hello, World!

Write-Output "Welcome!"
Write-Output ("Logged as " + $env:USERNAME)

$name = Read-Host "Enter your name"
Write-Output ("Hello, $name!")

$password = Read-Host -Prompt "Enter your password" -AsSecureString
[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

Read-Host

#endregion
