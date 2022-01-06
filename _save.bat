:: Opens Powershell in Windows Terminal and bypasses script execution policy to run ./scripts/add.ps1
wt -p "Windows PowerShell" -d "%cd%" cmd /k powershell.exe -noprofile -executionpolicy bypass -command "scripts/add.ps1"
