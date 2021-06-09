
$post_uri = "https://jsonplaceholder.typicode.com/posts"

$params = @{
  "title"="foo";
  "body"="bar";
  "userId"="1";
}

$response = Invoke-WebRequest -Uri $post_uri -Method Post -Body $params 

if ($response.StatusCode -lt 300) {
  Write-Output $response.Content
}

Invoke-RestMethod -Uri $post_uri -Method Post -Body $params `
| ConvertTo-Json `
| Write-Output

Read-Host "Done!"
