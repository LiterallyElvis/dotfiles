# Path to your oh-my-zsh installation.
export ZSH=/Users/jeffrey/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
plugins=(git jsontools sublime)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin"
source $ZSH/oh-my-zsh.sh
source $HOME/.work.sh
export PATH=/Users/jeffrey/.bin:$PATH

# Setting PATH for Python 3.5
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

# Golang stuff
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Python env helper functions
function setup_env(){
    pyvenv .env
}

function use_env(){
    . .env/bin/activate
}

function setup_env_2(){
    virtualenv -p /usr/bin/python2.7 .env
    use_env_2
}

function use_env_2(){
    source .env/bin/activate
}

# miscellany
function checkout(){
    git fetch
    git checkout $1
    git pull
}

function get_repo(){
    git clone git@github.com:$1

    IFS="/" read -rA repo_info <<< "$1"
    repo_org="${repo_info[1]}"
    repo_dir="${repo_info[2]}"

    cd $repo_dir
}

function update_branch_with(){
    if [ -z "$1" ]
    then
        echo "\e[1m\e[31mERROR\e[0m: No branch provided to update current branch with!"
    else
        current_branch=$(git rev-parse --abbrev-ref HEAD)
        git checkout $1
        git pull
        git checkout $current_branch
        git merge $1
    fi
}

function whats_running_on(){
    lsof -i tcp:$1
}

function style_check(){
    flake8 --ignore=E309,E501,E301 --exclude=".env*" .
}

function docker_clean(){
    docker rm -v $(docker ps -a -q -f status=exited)
    docker rmi $(docker images -f "dangling=true" -q)
}

function edit_commands(){
    code ~/.zshrc
}

function update_terminal(){
    source ~/.zshrc
    cp ~/.zshrc ~/Dropbox/Dotfiles
    cp ~/.work.sh ~/Dropbox/Dotfiles
}

function klear(){
    osascript -e 'if application "Terminal" is frontmost then tell application "System Events" to keystroke "k" using command down'
}

function cpdir(){
    cp -rf $1 $2
}