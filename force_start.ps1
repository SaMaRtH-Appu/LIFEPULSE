$ErrorActionPreference = "Stop"

# 1. Kill any existing Java processes to free up ports
Write-Host "Stopping existing servers..."
Get-Process -Name "java" -ErrorAction SilentlyContinue | Stop-Process -Force

# 2. Setup Paths
$JavaDir = Get-ChildItem -Path $PSScriptRoot -Filter "java-*" -Directory | Select-Object -First 1
$MavenDir = "$PSScriptRoot\maven_tool\apache-maven-3.9.6"

if (-not $JavaDir) { Write-Error "Java not found"; exit 1 }

$env:JAVA_HOME = $JavaDir.FullName
$env:M2_HOME = $MavenDir
$env:PATH = "$($JavaDir.FullName)\bin;$MavenDir\bin;$env:PATH"

# 3. Clean and Run
Write-Host "Starting AuraHealth on Port 8081..."
mvn clean jetty:run
