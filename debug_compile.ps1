$JavaDir = Get-ChildItem -Path $PSScriptRoot -Filter "java-*" -Directory | Select-Object -First 1
$MavenDir = "$PSScriptRoot\maven_tool\apache-maven-3.9.6"

$env:JAVA_HOME = $JavaDir.FullName
$env:M2_HOME = $MavenDir
$env:PATH = "$($JavaDir.FullName)\bin;$MavenDir\bin;$env:PATH"

mvn clean compile
