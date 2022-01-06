:: Opens Powershell in Windows Terminal and bypasses script execution policy to run ./scripts/unzi.ps1
wt -p "Windows PowerShell" -d "%cd%" cmd /k powershell.exe -noprofile -executionpolicy bypass -command "scripts/unzi.ps1"
