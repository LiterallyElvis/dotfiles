/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python3 go zsh jq
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
curl -L https://raw.githubusercontent.com/powerline/fonts/master/install.sh | sh
chsh -s /usr/local/bin/zsh
mkdir ~/golang
touch ~/.zshrc
touch ~/.work.sh
cp ~/Dropbox/Dotfiles/.zshrc ~

# To get terminal appearance correct,
# install hack from the powerline fonts 
# and import seti.terminal