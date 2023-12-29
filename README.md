# Zipsi

Unzip Word, Excel, and PowerPoint documents to track changes with git.

## Disclaimer

I don't take responsibility if these scripts accidentally delete your work. The MIT license should reflect that. That said, any releases have been battle-tested for writing a thesis. I think these are fine for writing theses, but to write papers one should learn LaTeX. I've opted for MS office docs for now since I think they tend to have less formatting issues for making notes than the papers I've read through (presumably written in LaTeX). Additionally I know how to produce nice comparison files with Word to send to my thesis supervisor and advisor to get better feedback.

**Always have multiple backups of important work.**

Also read through the "Todo" section below before usage.

## Description

A collection of small scripts I wrote to track my masters's thesis on GitHub.

In short, .docx, .xlsx, and .pptx files are just zip archives and
- [/scripts/unzip.sh](/scripts/unzip.sh) unzips them into folders. It also adds line breaks between the xml tags to make the diffs more readable in commit history.
- [/scripts/zip.sh](/scripts/zip.sh) recreates the original files by zipping the unzipped folders. All operations are done on copies, **leaving the original files unmodified**. The recreated files (ones with a "_zipped" postfix) won't be unzipped again. If you want them to be unzipped again, follow the steps below:
    1. Move the original file somewhere else (to a backup folder for example).
    2. Remove the postfix from the recreated file.
    3. Run the unzip script again.
- [_open-terminal.sh](_open_terminal.bat) is just a shortcut to open iTerm in case one is navigating through finder.

The scripts scan all subfolders for relevant files and they assume they're being called from the root of the repository. Additionally, they are extendable to work with various other MS Office file extensions. By default only .docx and .xlsx file extensions are supported as 1) I don't have a need for other file formats and 2) PowerPoint files for example are more likely to contain images (large binary files) and I don't want to encourage uploading those to GitHub.

## Installation
1. do git clone in your home directory ~
2. install the zsh function from .zshrc
3. restart your terminal

## Usage
1. Navigate to an empty directory
2. Run `zipsi init`
3. Add all, do the initial commit, add your docx, xlsx, pptx files 
4. Run `zipsi save`, go through the flow
5. Continue working and run `zipsi save` whenever you want to commit

* To restore an old version, navigate to that point in git commit history via git commands, and run `zipsi restore`
* These scripts won't sync the original files. Therefore, I recommend using another sync system such as OneDrive to have multiple backups.

## Todo
The goal here for now was to get the script collection to a point where I'm able to start working on my thesis again. Most QoL, usability, rigorous testing, etc. can be done later on my own time (famous last words?).

- Clean up readme
- Release on brew and maybe find a proper solution instead of the zsh function
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
