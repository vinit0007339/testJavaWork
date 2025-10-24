# testJavaWork

Spring Boot Maven project created by assistant.

## Quick Start

Build and run (Windows PowerShell):

```powershell
# build and run (script will build and start jar in background)
./run.ps1
```

Or manually using Maven wrapper:

```powershell
# Set JAVA_HOME if needed
$env:JAVA_HOME = "C:\Program Files\Java\jdk-21"

# build only
./mvnw.cmd clean package -DskipTests

# run the built jar
java -jar target/test-java-work-0.0.1-SNAPSHOT.jar
```

## What it does

- The project exposes a simple HTTP endpoint at `/` which returns: `Hello from Spring Boot (testJavaWork)!`
- Runs on port 8080 by default
- Uses Maven wrapper so no system Maven installation required

## Testing

Once running, test the endpoint:

```powershell
Invoke-WebRequest -Uri "http://localhost:8080/" -UseBasicParsing
```

Or open http://localhost:8080/ in a web browser.
