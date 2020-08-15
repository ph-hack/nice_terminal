#!/bin/bash

# current directory
CUR=$PWD

sudo apt-get update

function step {
       echo "$1 --------------------------------------------"
}

function end {
	echo "OK ---------------------------------------------"
}

step "Installing zsh terminal"
sudo apt-get install zsh
end

step "Installing oh my zsh"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
end

step "Installing syntax highlight"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
end

step "Installing auto suggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
end

step "Installing search files and history feature"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
end

step "Installing font Hack"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hack.zip
mkdir $HOME/.fonts && cd $HOME/.fonts
unzip ~/Hack.zip
cd $CUR
end

step "Installing PowerLevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
end

step "Replace the config files"
cp .mybash $HOME/.mybash
cp .zshrc $HOME/.zshrc
end

step "Loading configs"
source $HOME/.zshrc
end
