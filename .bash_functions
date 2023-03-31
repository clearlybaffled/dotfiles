# Hotwire git command to handle the bare dotfile repo in $HOME

function git {
  local GIT=/usr/bin/git
  local dotfiles_args="--git-dir=$HOME/.cfg/ --work-tree=$HOME"
  if [[ $(pwd) = $HOME ]]
  then
    $GIT $dotfiles_args $@
  else
    pushd $HOME >/dev/null
    local dirs=$($GIT --git-dir=$HOME/.cfg --work-tree=$HOME ls-files | xargs -n 1 dirname | sort | uniq  )
    popd >/dev/null
    if $(echo $dirs  | grep -Fq ${PWD#"$HOME/"}) # TODO: Fix for root dir case
    then 
      $GIT $dotfiles_args $@
    else
      $GIT $@
    fi
  fi
}

# vim: ft=bash ts=2 sw=2 et
