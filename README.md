Inspired by https://github.com/mathiasbynens/dotfiles and https://github.com/donnemartin/dev-setup

### Usage

Simply run `./init.sh`

### Configure iTerm2:

  1. Open iTerm2.
  1. Go to iTerm2 > Preferences > Profiles.
  1. Click on the '+' button to create a new profile.
  1. Name the new profile as 'nick'.
  1. Click on the 'Other Actions' button (gear icon), then select 'Import JSON Profiles' and choose your `nick_iterm2_profile.json` file.
  1. After importing, select the 'nick' profile and click on the 'Other Actions' button (gear icon), then select 'Set as Default'.
  1. Under the section Window, change the size to something better, like Columns: 125 and Rows: 35. I also like to set General > Working Directory > Reuse previous session's directory. Enable unlimited scrollback under Terminal. Finally, I change the way the option key works so that I can quickly jump between words as described [here](https://apple.stackexchange.com/questions/154292/iterm-going-one-word-backwards-and-forwards).

### TODO:
- add github SSH generation scripts
- Add docs for:
  - configure meld https://yousseb.github.io/meld/
  - configure conflicting shotcuts like cmd+shift+a needed for IJ and cmd+space needed for alfrad


### Other:
- zsh theme: https://mindthecode.com/blog/customize-the-terminal
