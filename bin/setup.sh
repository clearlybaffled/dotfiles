set -e
GIT="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
REPO="git@github.com:clearlybaffled/dotfiles.git"


git clone --bare $REPO $HOME/.cfg 


$GIT reset --hard # ':!*.md'
$GIT config status.showUntrackedFiles no
$GIT config --local include.path $HOME/git/.gitconfig
$GIT submodule update --init --remote
$GIT remote set-url origin $REPO
ln -sf git/.gitconfig .

set +e

source $HOME/.bashrc

# References: 
# - https://bitbucket.org/durdn/cfg/src/master/.bin/install.sh
# - https://stackoverflow.com/questions/18329621/how-to-store-a-git-config-as-part-of-the-repository
