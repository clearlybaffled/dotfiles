# Hotwire git command to handle the bare dotfile repo in $HOME

function git {
  local GIT=/usr/bin/git
  local dotfiles_args="--git-dir=$HOME/.cfg/ --work-tree=$HOME"
  if [[ $(pwd) = $HOME ]]
  then
    $GIT $dotfiles_args "$@"
  else
    pushd $HOME >/dev/null
    local dirs=$($GIT --git-dir=$HOME/.cfg --work-tree=$HOME ls-files | xargs -n 1 dirname | sort | uniq  )
    popd >/dev/null
    if $(echo $dirs  | grep -Fq ${PWD#"$HOME/"}) # TODO: Fix for root dir case
    then 
      $GIT $dotfiles_args "$@"
    else
      $GIT "$@"
    fi
  fi
}

function kubectlgetall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    # echo "Resource:" $i
    kubectl -n ${1} get --ignore-not-found --show-kind ${i}
  done
}

# short alias to set/show context/namespace (only works for bash and bash-compatible shells, current context to be set before using kn to set namespace)
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

# vim: ft=bash ts=2 sw=2 et

function patchfin {
  [ "$1" ] && \
    kubectl get $1 -o name \
      | xargs -I{} kubectl patch {} --type json --patch='[ { "op": "remove", "path": "/metadata/finalizers" } ]'
}

function unclaim {
  for pv in "$@"
  do
    kubectl patch pv $pv --type=json -p '[{"op":"remove","path":"/spec/claimRef/uid"},{"op":"remove","path":"/spec/claimRef/resourceVersion"}]'
  done
}

function wipeclaim {
  for pv in "$@"
  do
   kubectl patch pv $pv --type=json -p '[{"op":"remove","path":"/spec/claimRef"}]'
  done
}
