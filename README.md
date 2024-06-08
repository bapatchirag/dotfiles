# dotfiles
Linux/ZSH environment sync

## TODO
- [ ] Try out CoC; add to script if useful

## vim/nvim plugin list 

Plugins installed via Vundle:
- Lightline: Status bar
- Rose-Pine: Theme
- Signify: VCS symbols
- Surround: Change surround symbols ("" -> '')
- NerdTree: File explorer
    - NerdTree syntax highlight
    - Devicons
- ALE: Error checker/Linter
- Peekaboo: Quick search and enumerate
- Lightline-ale: ALE integration in lightline status bar
- lightline-bufferline: Buffer info integration in lightline status bar
- vim-fzf: FZF integration with vim

## System tools list
- neofetch: System status
- ZSH autocomplete
- ZSH syntax highlight
- fzf: Fuzzy finder
- Kitty: Terminal emulator
- FantasqueSans: Nerd font


## Installation
- Clone dotfiles repo
`git clone https://github.com/bapatchirag/dotfiles.git`
- Change permissions of install script
`chmod 777 install.sh`
- Run install script
`./install.sh`
- For kitty, edit the location of the background image to the location of the image as downloaded
- For vim, install plugins by starting vim and running `:PluginInstall`. Restarting vim should show changes
