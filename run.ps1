# Build and run the Spring Boot Maven project (PowerShell)
param(
    [string[]]$args
)

Set-Location $PSScriptRoot

# Set JAVA_HOME if not already set
if (-not $env:JAVA_HOME) {
    $javaHome = "C:\Program Files\Java\jdk-21"
    if (Test-Path $javaHome) {
        $env:JAVA_HOME = $javaHome
        Write-Host "JAVA_HOME set to: $env:JAVA_HOME"
    }
}

Write-Host "Building with Maven wrapper (skip tests)..."
.\mvnw.cmd clean package -DskipTests
if ($LASTEXITCODE -ne 0) { Write-Error "Maven build failed"; exit $LASTEXITCODE }

$jar = Get-ChildItem -Path target -Filter "*-SNAPSHOT.jar" | Select-Object -First 1
if (-not $jar) { Write-Error "Built jar not found in target/"; exit 1 }

Write-Host "Starting jar: $($jar.Name)"
Write-Host "Application will be available at: http://localhost:8080/"
Start-Process -FilePath java -ArgumentList '-jar', $jar.FullName
Write-Host "Application started in background. Use 'Get-Process java' to find the process." 
