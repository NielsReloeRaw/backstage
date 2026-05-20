param(
    [string]$Tag = "latest",
    [string]$Registry = "ghcr.io",
    [string]$ImageName = "nielsreloeraw/backstage"
)

$FullImage = "$Registry/$ImageName`:$Tag"

Write-Host "Building $FullImage..."
docker build -t $FullImage .

if ($LASTEXITCODE -ne 0) {
    Write-Error "Build mislukt."
    exit 1
}

Write-Host "Pushing $FullImage..."
docker push $FullImage

if ($LASTEXITCODE -ne 0) {
    Write-Error "Push mislukt. Ben je ingelogd? Voer uit: docker login ghcr.io -u <gebruikersnaam>"
    exit 1
}

Write-Host "Klaar: $FullImage"
