# Readable Word and Excel diffs
A collection of small scripts that I use to track my bachelor's thesis on GitHub. In short, .docx and .xlsx files are just zip archives and
- [/scripts/add.ps1](/scripts/add.ps1) unzips them into folders and adds line breaks between the xml tags to make the diffs human readable in GitHub commit history. It also commits and pushes all changes.
- [_save.bat](_save.bat) is just an easy way to access the script above.
- [_open_terminal.bat](_open_terminal.bat) is just an easy way to open Windows Terminal in this folder to manually fix things in case something goes wrong.

There's probably a lot more MS Office file extensions that will work with these scripts too. It just that for example PowerPoints usually include images (large binary files) and I don't want to encourage uploading those to GitHub.

## Todo
- Script to automatically create the original files from the unzipped folders.
    - I couldn't figure how to get `tar` to zip a given folder's contents without putting them inside a folder in the final archived file.
    - I don't need this as I use OneDrive to sync the original files between my computers. I know, it's a somewhat terrible practice to use two sync systems in parallel, but whatever works, right? Plus I guess it gives extra peace of mind when writing a thesis.
- Close Windows Terminal after saving is done.
    - This would have been useful but I couldn't figure it out in a reasonable amount of time. It's not as straightforward as you think as the scripts launch `cmd` to open Windows Terminal (`PowerShell`) to open `PowerShell` yet again to bypass some execution policy Windows has on by default. I didn't want to disable the policy system wide as it's probably there for a reason.
- Mac version. I don't currently have access to a Mac. On top of that I'm planning to transition to some Linux distro when I no longer need Windows for university (most courses assume the students are using Windows PCs).

## Requirements
- Windows Terminal
- Git
- Probably something else too; I haven't tested these with a clean install. You'll figure it out if something doesn't work.
