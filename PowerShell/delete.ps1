
$file_path = $MyInvocation.MyCommand.Path

Write-Output $file_path

Read-Host "Press key to delete this script file"

Remove-Item $file_path

Write-Output "File was deleted"

Read-Host "Done"
