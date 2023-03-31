git clone --bare git@github.com:clearlybaffled/dotfiles.git $HOME/.cfg 

GIT="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

$GIT reset --hard # ':!*.md'
$GIT config status.showUntrackedFiles no
$GIT config --local include.path $HOME/git/.gitconfig
$GIT submodule update --init --remote

source $HOME/.bashrc

# References: 
# - https://bitbucket.org/durdn/cfg/src/master/.bin/install.sh
# - https://stackoverflow.com/questions/18329621/how-to-store-a-git-config-as-part-of-the-repository
