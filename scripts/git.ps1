git status
Write-Output "`nDo you want to add all and commit?`n"
Pause
git add --all
git commit
Write-Output "`nPush to remote?`n"
Pause
git push
# Write-Output "`nOpen the repository in Microsoft Edge?`n"
# Pause
# Start-Process microsoft-edge:<insert-url-here>
