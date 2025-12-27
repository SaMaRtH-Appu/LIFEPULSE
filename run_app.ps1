$JavaDir = Get-ChildItem -Path $PSScriptRoot -Filter "java-*" -Directory | Select-Object -First 1
$MavenDir = "$PSScriptRoot\maven_tool\apache-maven-3.9.6"

if (-not $JavaDir) {
    Write-Error "Java 1.8 directory not found in project root!"
    exit 1
}
if (-not (Test-Path $MavenDir)) {
    Write-Error "Maven directory not found! Run install_maven_v2.ps1 first."
    exit 1
}

$env:JAVA_HOME = $JavaDir.FullName
$env:M2_HOME = $MavenDir
$env:PATH = "$($JavaDir.FullName)\bin;$MavenDir\bin;$env:PATH"

Write-Host "Using Java: $($env:JAVA_HOME)"
Write-Host "Using Maven: $($env:M2_HOME)"
Write-Host "Starting AuraHealth Server..."
Write-Host "➤ Access the App at: http://localhost:8081/aurahealth" -ForegroundColor Green

mvn clean jetty:run
