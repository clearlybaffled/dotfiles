#!/bin/bash

function config {
  if [[ $(pwd) = $HOME ]]; then
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
  else
    /usr/bin/git $@
  fi
}

