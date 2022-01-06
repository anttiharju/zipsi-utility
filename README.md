# Zipsi: Git diff utility for Word and Excel documents

## Disclaimer

I don't take responsibility  if these scripts destroy your work. I think the MIT license reflects that. Always have multiple backups of important work.

That said, the scripts are relatively simple and anyone that has some understanding of programming and git should be able to understand what the scripts do. PowerShell is kind of verbose scripting language, so even if you are not familiar with it you're very likely able to figure out what the individual commands do.

## Description

A collection of small scripts I use to track my bachelor's thesis on GitHub. In short, .docx and .xlsx files are just zip archives and
- [/scripts/unzi.ps1](/scripts/unzi.ps1) unzips them into folders. It also adds line breaks between the xml tags to make the diffs more readable in GitHub commit history. Additionally, it commits and pushes all changes.
- [/scripts/zi.ps1](/scripts/unzi.ps1) reconstructs the original files by zipping the unzipped folders. All operations are done on copies, meaning that **the original files shouldn't be modified by these scripts**. The reconstructed files (files with the "zipped" prefix) won't be unzipped again. If you them to be unzipped again, follow the steps below (read them through before doing any of them):
    1. Manually delete the original file. I hope you know what you're doing.
    2. Remove the prefix from the reconstructed file.
    3. Run the unzip script again.
- [_save.bat](_save.bat) is just an easy way to access the unzip script.
- [_open_terminal.bat](_open_terminal.bat) is just an easy way to open Windows Terminal to manually fix things if (when) the script fails and messes things up.

The scripts are extendable to work with various other MS Office file extensions. By default, the scripts support .docx and .xlsx files. PowerPoint files aren't supported out of the box as they are more likely to contain images (large binary files) and I don't want to encourage uploading those to GitHub as the platform isn't meant for that kind of storage.

## Todo
- Close Windows Terminal after saving is complete.
    - This would have been useful, but I couldn't figure it out in a reasonable amount of time. It's not as straightforward to implement as one might think: the scripts launch `cmd` to open Windows Terminal (`PowerShell`) to open `PowerShell` yet again to bypass some execution policy Windows has on by default. I didn't want to disable the policy system wide as it's there probably for a reason.
- Move git commands from the unzip script to a separate file. The reasons above apply here too.
- Mac version? I don't currently own a Mac. I'm also planning to transition to some Linux distro when I no longer need Windows for university (most courses assume the students are using Windows PCs).

## Requirements
- Windows Terminal
- Git
- Probably something else too; I'm haven't tested these scripts with a clean install. You'll figure it out if something doesn't work.
