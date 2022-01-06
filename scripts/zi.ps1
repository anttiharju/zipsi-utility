# Mr. PowerShell I don't feel so good (this feels kind of hacky)
$root = Split-Path (Split-Path $MyInvocation.MyCommand.Path -Parent) -Parent

# Zip .docx
$directories = Get-ChildItem . -recurse -filter "*_unzipped_docx" -Directory
ForEach ($directory in $directories)
{
    # Setup
    Set-Location $directory.FullName
    $path = Split-Path $directory.FullName -Parent
    $split = ($directory.BaseName -split "_unzipped_")
    $name = $split[0]
    $extension = $split[1]
    $tmpName = ($name + "_" + $extension + ".zip")
    $tmpFullPath = ($path + "\" + $tmpName)
    $zippedName = ("zipped " + $name + "." + $extension)
    $zippedFullPath = ($path + "\" + $zippedName)

    # Remove old files
    if (Test-Path -Path $tmpFullPath -PathType Leaf) {
        Remove-Item $tmpFullPath
    }
    if (Test-Path -Path $zippedFullPath -PathType Leaf) {
        Remove-Item $zippedFullPath
    }

    # Create new files
    Compress-Archive * $tmpFullPath
    Rename-Item -Path $tmpFullPath -NewName $zippedName
}
Set-Location $root

# Zip .xlsx - yes, this should also be DRY'd
$directories = Get-ChildItem . -recurse -filter "*_unzipped_xlsx" -Directory
ForEach ($directory in $directories)
{
    # Setup
    Set-Location $directory.FullName
    $path = Split-Path $directory.FullName -Parent
    $split = ($directory.BaseName -split "_unzipped_")
    $name = $split[0]
    $extension = $split[1]
    $tmpName = ($name + "_" + $extension + ".zip")
    $tmpFullPath = ($path + "\" + $tmpName)
    $zippedName = ("zipped " + $name + "." + $extension)
    $zippedFullPath = ($path + "\" + $zippedName)

    # Remove old files
    if (Test-Path -Path $tmpFullPath -PathType Leaf) {
        Remove-Item $tmpFullPath
    }
    if (Test-Path -Path $zippedFullPath -PathType Leaf) {
        Remove-Item $zippedFullPath
    }

    # Create new files
    Compress-Archive * $tmpFullPath
    Rename-Item -Path $tmpFullPath -NewName $zippedName
}
Set-Location $root
