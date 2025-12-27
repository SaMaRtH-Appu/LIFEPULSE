$Url = "https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip"
$Zip = "$PSScriptRoot\maven.zip"
$Dest = "$PSScriptRoot\maven_tool"

if (Test-Path $Dest) { Remove-Item -Recurse -Force $Dest }
New-Item -ItemType Directory -Force -Path $Dest | Out-Null

Write-Host "Downloading (Archive)..."
Invoke-WebRequest -Uri $Url -OutFile $Zip

Write-Host "Extracting with tar..."
cd $Dest
tar -xf $Zip

Write-Host "Done."
