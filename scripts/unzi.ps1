$files = Get-ChildItem .\ -recurse -include *.docx,*.xlsx -exclude zipped*,tmp_copy_*

# Create folders
ForEach ($file in $files)
{
    $path = Split-Path -Path $file.FullName
    $extension = ((Split-Path $file.FullName -Leaf).Split('.'))[1]
    $folderName = ($file.BaseName + "_unzipped_" + $extension)
    $folderPath = ($path + "\" +  $folderName)
    $destinationPath = ($path + "\tmp_copy_" + $file.BaseName + ".")

    Remove-Item -LiteralPath $folderPath -Force -Recurse -ErrorAction SilentlyContinue
    
    $folder = New-Item -Path $path -Type Directory -Name $folderName

    Copy-Item -Path $file.FullName -Destination ($destinationPath + $extension)
    Rename-Item -Path ($destinationPath + $extension) -NewName ($destinationPath + "zip")
    Expand-Archive -Path ($destinationPath + "zip") -DestinationPath $folderPath
    Remove-Item ($destinationPath + "zip")
}

# Add line breaks to .docx xmls
$directories = Get-ChildItem . -recurse -filter "*_docx" -Directory

ForEach ($directory in $directories)
{
    $files = Get-ChildItem $directory.FullName -recurse | where {$_.extension -in ".xml",".rels"}
    
    ForEach ($file in $files)
    {
        $content = Get-Content -LiteralPath $file.FullName
        $content -replace "><", ">`n<" | Set-Content -LiteralPath $file.FullName
    }
}

## Add line breaks to .xlsx xmls - I know, I know, this should be DRY'd
$directories = Get-ChildItem . -recurse -filter "*_xlsx" -Directory

ForEach ($directory in $directories)
{
    $files = Get-ChildItem $directory.FullName -recurse | where {$_.extension -in ".xml",".rels"}
    
    ForEach ($file in $files)
    {
        $content = Get-Content -LiteralPath $file.FullName
        $content -replace "><", ">`n<" | Set-Content -LiteralPath $file.FullName
    }
}
