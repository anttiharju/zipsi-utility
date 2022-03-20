# Zipsi

Unzip Word and Excel documents to track changes with git.

## Disclaimer

I don't take responsibility if these scripts accidentally delete your work. I think the MIT license reflects that.

**Always have multiple backups of important work.**

## Description

A collection of small scripts I wrote to track my bachelor's thesis on GitHub.

In short, .docx and .xlsx files are just zip archives and
- [/scripts/unzi.ps1](/scripts/unzi.ps1) unzips them into folders. It also adds line breaks between the xml tags to make the diffs more readable in GitHub commit history.
- [/scripts/zi.ps1](/scripts/zi.ps1) recreates the original files by zipping the unzipped folders. All operations are done on copies, **leaving the original files unmodified**. The recreated files (ones with a "zipped" prefix) won't be unzipped again. If you want them to be unzipped again, follow the steps below:
    1. Move the original file somewhere else (to a backup folder for example).
    2. Remove the prefix from the recreated file.
    3. Run the unzip script again.
- [_save.bat](_save.bat) is just a quick & easy way to run the unzip script and to push all changes.
- [_open_terminal.bat](_open_terminal.bat) is just an easy way to open Windows Terminal to manually fix things if (when) the scripts fail. Plus you can run [/scripts/zi.ps1](/scripts/zi.ps1) through this.

The scripts scan all subfolders for relevant files and they assume they're being called from the root of the repository. Additionally, they are extendable to work with various other MS Office file extensions. Although by default only .docx and .xlsx file extensions are supported. I don't have a need for other file format and PowerPoint for example are more likely to contain images (large binary files) and I don't want to encourage uploading those to GitHub.

## Usage
1. Create a new (private) repo on GitHub and clone that to your computer.
2. Copy the files in this repo (Code -> Download zip) to your new repo's local folder.
    - If you know what you're doing, you can also just clone this but don't do it because you want to have an easy update channel: I don't guarantee backwards compatibility with future versions.
3. Work on your .docx or .xlsx files.
4. Run [_save.bat](_save.bat) whenever you want to save your progress.

These scripts won't sync the original files. Therefore, I recommend using another sync system such as OneDrive to have multiple backups.

## Todo
- Remove repetition from the scripts (DRY).
- Make it possible to use zipsi by simply dropping a zipsi subfolder to the main project folder. This way the zipsi license file wouldn't need to be in the project root folder.
- Improve Git-only workflow.
    - Currently it's assumed that there's another sync system such as OneDrive being used alongside these scripts.
    - It's also somewhat assumed that the work isn't being done on multiple computers. `git pull` isn't done automatically.
    - This has to be carefully tought out to not destroy any unsaved work.

## Requirements
- Windows Terminal
- Git
- Probably something else too; I haven't tested these scripts with a clean install. You'll figure it out if something doesn't work.
