# Build and run the Java project
param(
    [string[]]$args
)

$src = "src/main/java"
$classpath = "out"

if (-not (Test-Path $classpath)) { New-Item -ItemType Directory -Path $classpath | Out-Null }

Write-Host "Compiling..."
javac -d $classpath (Get-ChildItem -Recurse -Filter "*.java" -Path $src | ForEach-Object { $_.FullName })
if ($LASTEXITCODE -ne 0) { Write-Error "Compilation failed"; exit $LASTEXITCODE }

Write-Host "Running..."
java -cp $classpath com.example.App @args
