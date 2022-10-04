# Dotfiles

Dotfiles used across multiple Linux machines. (I sure hope I don't upload my ssh
keys by accident :D)

## Restore

1. Clone the repository into the `$HOME/.cfg` directory on the local machine with
   `git clone -b master --bare <repo-url> $HOME/.cfg`
2. Checkout the contents into the `$HOME` directory with
   `git --git-dir=$HOME/.cfg --work-tree=$HOME checkout`
3. Restart the terminal to load the new config.
4. `config config --local status.showUntrackedFiles no`

## General information

### Adding files to be backed up (git add)
`config add <file>`

### Uploading the files to the remote (git push)
`config push`
