# `My Dotfiles` 

## *You know, just some days of my life gone forever*  

![Example Screenshot](.screenshots/ScreenOSx1.png)

### Table of contents

- [Table of contents](#table-of-contents)
    - [Rationale](#rationale)
    - [Dependencies & Useful stuff i use](#dependencies--useful-stuff-i-use)
    - [Installation](#installation)
    - [Alias and functions](#alias-and-functions)
    - [Karabiner Shortcuts](#karabiner-shortcuts)
    - [System shortcuts (Mostly used to freeup some combos)](#system-shortcuts-mostly-used-to-freeup-some-combos)

### Rationale

#### *Have a confy but effective environment on my personal/work laptop*

Coming from a Linux-only life I wanted the same shortcuts and user experience so:

- Command is used to administer system level functions
- Control is used to administer application/window level functions
- Opt & Shift are used as modifier to create new sub shortcuts on the same group (open/close/add bookmarks on D but with different modifier)
- The Caps key is mapped to Control to match my HHKB
- The aim is to use less and less mouse everyday
- Ease up my workflow with anything that bash can offer

### Dependencies & Useful stuff i use

- [Homebrew](https://brew.sh "Homebrew packet manager")
- [TMux](https://github.com/tmux/tmux "TMux")
- [Alacritty](https://github.com/jwilm/alacritty "Good rust terminal, too much impact on battery")
- [ITerm2](https://github.com/gnachman/iTerm2 "A terminal that just works")
- [TPM](https://github.com/tmux-plugins/tpm "TMux Plugin Manager")
- [Karabiner](https://github.com/tekezo/Karabiner-Elements "Karabiner-Elements")
- [Goku](https://github.com/yqrashawn/GokuRakuJoudo "Goku Karabiner DSL")
- [Magnet](https://magnet.crowdcafe.com "21st century windows management")
- [Vi IMproved](https://github.com/vim/vim "VIM")
- [VIM Plugin Manager](https://github.com/VundleVim/Vundle.vim "Vundle")
- [Highlight](http://www.andre-simon.de/doku/highlight/highlight.php "cat but with awesome highlighting")
- [M-Cli](https://github.com/rgcr/m-cli "MacOs admin cli")
- [Duti](https://github.com/moretension/duti/ "Change MacOS default apps")
- [Cascadea](https://cascadea.app "Dark theme all the things")
- [MDV](https://github.com/axiros/terminal_markdown_viewer "A markdown viewer for the terminal")

### Installation

- Satisfy every aforementioned dependency and run 
- Backup any conflicting dotfile in your home directory
- `git clone https://gitlab.com/MatteoManzoni/dotfiles.git ~/`
- Run ./.brew_packages
- If everything is setup correctly login and logout
- Enjoy

### [Alias and functions](.useful_commands.md "All my custom things and some useful stuff")

### Karabiner Shortcuts

| Key           | Do What       |
| ------------- |:-------------:|
| CapsLock      | Left Ctrl     |
| Command T | Open iTerm |
| Command S | Open Safari |
| Command C | Open VSCode |
| Command F | Open Reeder |
| Command E | Open Mail |
| Command \ | Open Bitwarden |
| Command W | Open Calendar |
| Command A | Open Contacts |
| Command / | Open Telegram |
| Command N | Open Notes |
| Command H | Open Shortcut file |
| Command Shift H | Open dotfile README |
| Command Opt H | Open useful commands file |
| Command ' | Open Slack |
| Command ] | Open Textual |
| Command V | Open Finder |
| Command M | Open Music |
| Command J | Open Jabber search menu |
| Ctrl C | Copy |
| Ctrl V | Paste |
| Ctrl Shift C | Copy in terminal applications |
| Ctrl Shift V | Paste in terminal applications |
| Ctrl Shift X | Cut in terminal applications |
| Ctrl X | Cut |
| Ctrl S | Save |
| Ctrl Z | Undo |
| Ctrl Shift Z | Redo |
| Home | Beginning of the line |
| End | End of the line |
| F5 | Reload but not in debuggers |
| Ctrl R | Reload |
| Ctrl A | Select All |
| Ctrl T | New Tab |
| Ctrl Shift T | Reopen last closed tab |
| Ctrl F | Find |
| Ctrl O | Open |
| Ctrl N | New |
| Ctrl Shift N | New with modifier |
| Ctrl B/I/U | Switch to Bold/Italic/Underlien |
| Ctrl Q | Quit Program |
| Ctrl H | Hide Window |
| Ctrl W | Close Window |
| Ctrl M | Minimize Window |
| Command L | Lock Session |
| PrintScreen | Full Screen Screenshot |
| Shift PrintScreen | Selection Screenshot |
| Ctrl L | Browse open location |
| Option <- | Back |
| Option -> | Forward |
| Ctrl Delete | Delete no confirm |
| Ctrl + | Browser zoom + |
| Ctrl - | Browser zoom - |
| Command -> | Snap Right |
| Command <- | Snap Left |
| Command Return | Current window full screen (Hypervisors too) |
| Command Backspace | Restore current window (Hypervisors use Command Return again) |
| Command -> | Snap Right |
| Ctrl P | Print |
| Command P | Preferences |
| Ctrl Shift D | Add bookmark |
| Ctrl D | Show bookmarks panel |
| Command D | Show Desktop |
| Ctrl Option D | Add to reading list |
| Ctrl Option | Ungrab input from guest |

### System shortcuts (Mostly used to freeup some combos)

| Key           | Do What       |
| ------------- |:-------------:|
| Ctrl Shift Command D | Mission Control -> Show Desktop |
| Ctrl Option Command . | Mission Control -> Move right a space |
| Ctrl Option Command , | Mission Control -> Move left a space |
| Ctrl Command P | App Shortcuts -> Print |
| Opt Shift Command D | App Shortcut -> Hide Bookmarks |
| Opt Shift Command D | App Shortcut -> Show Bookmarks |
| Command Ctrl ADown | Mission Control -> Application Windows |
| Command Ctrl AUp | Mission Control -> Mission Control |
| Command Opt Tab | Keyboard -> Move focus to the active or next window |
| Command ; | Mission Control -> Show Notification Center |
