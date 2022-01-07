# Zipsi: Unzip Word and Excel documents to generate readable Git diffs

## Disclaimer

I don't take responsibility  if these scripts destroy your work. I think the MIT license reflects that. Always have multiple backups of important work.

That said, the scripts are relatively simple and anyone that has some understanding of programming and git should be able to understand what the scripts do. PowerShell is kind of verbose scripting language, so even if you are not familiar with it you're very likely able to figure out what the individual commands do.

## Description

A collection of small scripts I use to track my bachelor's thesis on GitHub. In short, .docx and .xlsx files are just zip archives and
- [/scripts/unzi.ps1](/scripts/unzi.ps1) unzips them into folders. It also adds line breaks between the xml tags to make the diffs more readable in GitHub commit history.
- [/scripts/zi.ps1](/scripts/zi.ps1) reconstructs the original files by zipping the unzipped folders. All operations are done on copies, meaning that **the original files shouldn't be modified by these scripts**. The reconstructed files (ones with a "zipped" prefix) won't be unzipped again. If want them to be unzipped again, follow the steps below:
    1. Manually delete the original file. I hope you know what you're doing.
    2. Remove the prefix from the reconstructed file.
    3. Run the unzip script again.
- [_save.bat](_save.bat) is just a quick & easy way to run the unzip script and to push all changes.
- [_open_terminal.bat](_open_terminal.bat) is just an easy way to open Windows Terminal to manually fix things if (when) the script fails and messes things up. Plus you can run [/scripts/zi.ps1](/scripts/zi.ps1) through this.

The scripts scan all subfolders for relevant files. It's also assumed they're being ran from the root of the repository. The scripts are extendable to work with various other MS Office file extensions. By default, the scripts support .docx and .xlsx files. PowerPoint files aren't supported out of the box as they are more likely to contain images (large binary files) and I don't want to encourage uploading those to GitHub.

## Usage
1. Create a new (private) repo on GitHub and clone that to your computer.
2. Copy the files in this repo (Code -> Download zip) to your new repo's local folder.
3. Work on your .docx or .xlsx files.
4. Run [_save.bat](_save.bat) whenever you want to save your progress.

These scripts won't sync the original files. Therefore, I recommend also using another sync system such as OneDrive to have multiple backups. I know it seems like a terrible practice, but for writing theses I think it's acceptable. Whatever works, right?

### But why?
- You can keep a journal of your progress in Git commit messages.
- You can have your thesis available on GitHub.
    - I've seen people like to do this.
    - Syncing the original file isn't great as you won't benefit from Git's compression abilities.
- The diffs are readable* and they might help you catch mistakes.
    - *All text is still wrapped in a bunch of xml tags, but it's better than syncing the original file.

## Todo
- Improve Git-only workflow.
    - Currently these scripts assume you sync the original files with some other service, e.g. OneDrive.
    - This has to be carefully tought out to not destroy any unsaved work.
- Remove repetition from the scripts.
- Mac version?
    - I don't currently own a Mac.
    - I'm also planning to transition to some Linux distro when I no longer need Windows for university (most courses assume the students are using Windows PCs).

## Requirements
- Windows Terminal
- Git
- Probably something else too; I haven't tested these scripts with a clean install. You'll figure it out if something doesn't work.
