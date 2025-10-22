# testJavaWork

Simple Java project created by assistant.

Build and run (Windows PowerShell):

```powershell
# compile and run
./run.ps1 "firstArg" "secondArg"
```

Or manually:

```powershell
# compile
javac -d out $(Get-ChildItem -Recurse -Filter "*.java" -Path src\main\java | ForEach-Object FullName)
# run
java -cp out com.example.App
```
