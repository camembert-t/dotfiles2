#!/bin/sh

echo "*** zsh & oh-my-zsh ***"
sudp apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ~/.myconfig/dotfiles2/mytheme.zsh-theme ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme
ln -s ~/.myconfig/dotfiles2/zshrc ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

exec zsh


echo "*** nvim ***"
sudo apt-get install -y neovim
sudo apt-get install -y python3-neovim
ln -s ~/.myconfig/dotfiles2/vimrc ~/.config/nvim/init.vim


echo "*** tools ***"
sudo apt-get install -y tmux
ln -s ~/.myconfig/dotfiles2/tmux.conf ~/.tmux.conf
sudo apt-get install -y universal-ctags
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y fzf
