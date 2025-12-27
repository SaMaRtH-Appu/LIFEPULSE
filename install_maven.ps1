$MavenVersion = "3.9.6"
$InstallDir = "$env:USERPROFILE\maven"
$MavenBin = "$InstallDir\apache-maven-$MavenVersion\bin"
$ZipUrl = "https://dlcdn.apache.org/maven/maven-3/$MavenVersion/binaries/apache-maven-$MavenVersion-bin.zip"
$ZipPath = "$env:TEMP\maven.zip"

Write-Host "1. Creating install directory at $InstallDir..."
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

Write-Host "2. Downloading Maven $MavenVersion..."
Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath

Write-Host "3. Extracting Maven..."
Expand-Archive -Path $ZipPath -DestinationPath $InstallDir -Force

Write-Host "4. Setting up Environment Variables..."
$env:PATH = "$MavenBin;$env:PATH"
[Environment]::SetEnvironmentVariable("Path", "$MavenBin;" + [Environment]::GetEnvironmentVariable("Path", "User"), "User")

Write-Host "5. Verifying Installation..."
mvn -version

Write-Host "---------------------------------------------------"
Write-Host "SUCCESS: Maven installed!"
Write-Host "You can now run: mvn jetty:run"
Write-Host "Note: You might need to restart your terminal for the PATH to persist globally."
