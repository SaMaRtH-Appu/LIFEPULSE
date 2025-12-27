$Url = "https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip"
$Zip = "$PSScriptRoot\maven.zip"
$Dest = "$PSScriptRoot\maven_tool"

Write-Host "Downloading..."
Invoke-WebRequest -Uri $Url -OutFile $Zip

Write-Host "Extracting..."
Expand-Archive -Path $Zip -DestinationPath $Dest -Force

Write-Host "Listing..."
Get-ChildItem -Recurse $Dest | Select-Object FullName
