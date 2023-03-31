# dotfiles

## Setup

```
$ curl -Lks https://raw.githubusercontent.com/clearlybaffled/dotfiles/master/bin/setup.sh | bash
```

Uses a bare git repository to land all the files directly into $HOME instead of needing to setup links, copies, etc.

Extra bash function to call the right version of git depending on whether or not pwd is within the dotfiles repo or somewhere else.

References:
- https://news.ycombinator.com/item?id=11071754
- https://www.atlassian.com/git/tutorials/dotfiles
- https://bitbucket.org/durdn/cfg/src/master/
