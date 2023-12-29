# Zipsi

Unzip Word, Excel, and PowerPoint documents to track changes with git.

## Disclaimer

I don't take responsibility if these scripts accidentally delete your work. The MIT license should reflect that. That said, any releases have been battle-tested for writing a thesis. I think these are fine for writing theses, but to write papers one should learn LaTeX. I've opted for MS office docs for now since I think they tend to have less formatting issues for making notes than the papers I've read through (presumably written in LaTeX).

**Always have multiple backups of important work.**

Also read through the "Todo" section below before usage.

## Description - FIXME

A collection of small scripts I wrote to track my masters's thesis on GitHub.

In short, .docx, .xlsx, and .pptx files are just zip archives and
- [/scripts/unzip.sh](/scripts/unzip.sh) unzips them into folders. It also adds line breaks between the xml tags to make the diffs more readable in commit history.
- [/scripts/zip.sh](/scripts/zip.sh) recreates the original files by zipping the unzipped folders. All operations are done on copies, **leaving the original files unmodified**. The recreated files (ones with a "zipped" prefix) won't be unzipped again. If you want them to be unzipped again, follow the steps below:
    1. Move the original file somewhere else (to a backup folder for example).
    2. Remove the prefix from the recreated file.
    3. Run the unzip script again.
- [_save.bat](_save.bat) is just a quick & easy way to run the unzip script and to push all changes.
- [_open_terminal.bat](_open_terminal.bat) is just an easy way to open Windows Terminal to manually fix things if (when) the scripts fail. Plus you can run [/scripts/zi.ps1](/scripts/zi.ps1) through this.

The scripts scan all subfolders for relevant files and they assume they're being called from the root of the repository. Additionally, they are extendable to work with various other MS Office file extensions. By default only .docx and .xlsx file extensions are supported as 1) I don't have a need for other file formats and 2) PowerPoint files for example are more likely to contain images (large binary files) and I don't want to encourage uploading those to GitHub.

## Usage - FIXME
1. Create a new (private) repo on GitHub and clone that to your computer.
2. Copy the files in this repo (Code -> Download zip) to your new repo's local folder.
    - If you know what you're doing, you can also just clone this but don't do it because you want to have an easy update channel: I don't guarantee backwards compatibility with future versions.
3. Work on your .docx or .xlsx files.
4. Run [_save.bat](_save.bat) whenever you want to save your progress.

These scripts won't sync the original files. Therefore, I recommend using another sync system such as OneDrive to have multiple backups.

## Todo
- Make it possible to use zipsi by simply dropping a zipsi subfolder to the main project folder. This way the zipsi license file wouldn't need to be in the project root folder.
- Newlines are inserted between any >< symbols (~any xml tags) in the .xml and .rels files of an unzipped document. This might alter actual contents of your documents as well.
    - This can be disabled (just delete all lines in unzip.sh after "# Increase diff readability..")
    - More robust solution should be looked for.
- Improve multicomputer Git workflow.
    - Currently it's assumed that there's another sync system such as OneDrive being used alongside these scripts (see disclaimer).
    - `git pull` isn't done automatically.
        - This has to be carefully thought out to not destroy any unsaved work.
            - Including git pull in .zshrc of multiple computers for the working directory could be an okay solution.
- Write tests. Just simple bash ones and compare files before/after and that directory structures are what is expected. While Docker containers may seem like an overkill, I've experienced in-development versions of these scripts messing up the files in my .git folder (just rm -rf the folder and git clone again saved me thankfully), so the isolation would be welcome.

## Trivia
### Why the name
* I like potato chips and one way to call them in Finnish is "sipsi"
* These scripts were originally written in PowerShell, and I thought it was funny to do a "domain hack" in the filenames, i.e., "./scripts/zi.ps1" could be leet-speak translated to zipsi, which sounds like sipsi.
* TL;DR because of powershell and potato chips

## Dependencies
- git
- bash
- perl
- zip
- unzip
- iTerm
- Probably something else too; I haven't tested these scripts with a clean install. You'll figure it out if something doesn't work.
