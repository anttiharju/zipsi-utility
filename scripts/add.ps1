# Get Word and Excel files - if you need more filetypes, add them.
$files = Get-ChildItem .\ -recurse | where {$_.extension -in ".docx",".xlsx"}

ForEach ($file in $files)
{
    ## Shared variables
    $path = Split-Path -Path $file.FullName
    $folderName = ($file.BaseName + "_" + ((Split-Path $file.FullName -Leaf).Split('.'))[1])
    $folderPath = ($path + "\" +  $folderName)

    # Remove previously created folder
    # It exists to have git generate diffs, the original file is left untouched
    Remove-Item -LiteralPath $folderPath -Force -Recurse -ErrorAction SilentlyContinue
    
    # Create folders for the original files to be unzipped into.
    # "." is replaced with "_" in the folder name as a folder and a file can't have the same name.
    $folder = New-Item -Path $path -Type Directory -Name $folderName

    # Unzip the original file into the created folder
    tar -xf $file.FullName -C $folderPath
}

# Add line breaks to changing files to increase diff readability
## docx
$directories = Get-ChildItem . -recurse -filter "*_docx" -Directory

ForEach ($directory in $directories)
{
    echo ("TITLE:" + $directory.BaseName)

    $files = Get-ChildItem $directory.FullName -recurse | where {$_.extension -in ".xml",".rels"}
    
    ForEach ($file in $files)
    {
        echo $file.BaseName
        $content = Get-Content -LiteralPath $file.FullName
        $content -replace "><", ">`n<" | Set-Content -LiteralPath $file.FullName
    }
}

## xlsx - I know, I know, this should be DRY'd but this works.
$directories = Get-ChildItem . -recurse -filter "*_xlsx" -Directory

ForEach ($directory in $directories)
{
    echo ("TITLE:" + $directory.BaseName)

    $files = Get-ChildItem $directory.FullName -recurse | where {$_.extension -in ".xml",".rels"}
    
    ForEach ($file in $files)
    {
        echo $file.BaseName
        $content = Get-Content -LiteralPath $file.FullName
        $content -replace "><", ">`n<" | Set-Content -LiteralPath $file.FullName
    }
}

git status
echo "`nDo you want to add all and commit?`n"
pause
git add --all
git commit
echo "`nPush to remote?`n"
pause
git push
# echo "`nOpen the repository in Microsoft Edge?`n"
# pause
# start microsoft-edge:<insert-url-here>
