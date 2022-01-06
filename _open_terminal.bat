:: This is in the root folder for easy access to manual debugging if (when) the scripts fail.
:: The goal of this workflow is to pretty much automate everything.

:: Opens PowerShell in Windows Terminal and bypasses execution policy to allow running PowerShell (.ps1) scripts
wt -p "Windows PowerShell" -d "%cd%" cmd /k powershell.exe -noprofile -executionpolicy bypass
