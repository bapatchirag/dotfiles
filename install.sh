# Install tools and env

# Kitty install
if [ -z `command -v kitty` ]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    # Kitty desktop icon and menu integration for Linux
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    echo 'kitty.desktop' > ~/.config/xdg-terminals.list
    # Copy kitty.conf to config location
    rm ~/.config/kitty/kitty.conf
    cp kitty.conf ~/.config/kitty/
fi

# FZF install
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Font install
git clone https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FantasqueSansMono.zip
if [ -n `command -v unzip` ]; then
    mkdir ~/FantasqueSansMono
    unzip FantasqueSansMono.zip -d ~/FantasqueSansMono
    cd ~/FantasqueSansMono
    cp FantasqueSans* ~/.local/share/fonts/
    fc-cache -f -v
fi

# If ZSH: autosuggestions and syntax highlight
if [ -n $ZSH_VERSION ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.tools/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.tools/zsh-syntax-highlighting
fi

# Neofetch install
git clone https://github.com/dylanaraps/neofetch ~/.tools/
cd ~/.tools/neofetch
make install

# Vundle install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy the config files to the right places
cp ~/.zshrc ~/.zshrc-old
cp zshrc ~/.zshrc
cp ~/.vimrc ~/.vimrc-old
cp vimrc ~/.vimrc
