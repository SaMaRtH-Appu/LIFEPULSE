$MavenVersion = "3.9.6"
$InstallDir = "$PSScriptRoot\maven_dist"
$MavenBin = "$InstallDir\apache-maven-$MavenVersion\bin"
$ZipUrl = "https://dlcdn.apache.org/maven/maven-3/$MavenVersion/binaries/apache-maven-$MavenVersion-bin.zip"
$ZipPath = "$env:TEMP\maven.zip"

Write-Host "1. Creating install directory at $InstallDir..."
if (Test-Path $InstallDir) { Remove-Item -Recurse -Force $InstallDir }
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

Write-Host "2. Downloading Maven $MavenVersion..."
Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath

Write-Host "3. Extracting Maven..."
Expand-Archive -Path $ZipPath -DestinationPath $InstallDir -Force

Write-Host "4. Setting up Environment Variables (Local)..."
$env:PATH = "$MavenBin;$env:PATH"

Write-Host "5. Verifying Installation..."
& "$MavenBin\mvn.cmd" -version

Write-Host "---------------------------------------------------"
Write-Host "SUCCESS: Maven installed locally!"
