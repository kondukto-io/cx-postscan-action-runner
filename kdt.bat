ECHO OFF
set arg1="%1"
shift
shift

PowerShell.exe -Command " & 'C:\Program Files\Checkmarx\Executables\kdtrunner.ps1' -f '%arg1%'"
