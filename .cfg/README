# Dotfiles

Dotfiles used across multiple Linux machines.

## Backup

1. Add `alias config='git --git-dir=$HOME/.cfg/ --working-tree=$HOME` to
   .bashrc file
2. Clone the repository into the home directory with 
   `git clone --bare <git-repo-url> $HOME/.cfg`
3. Checkout the content from the remote with `config checkout`
4. If step 3 fails, try removing the conflicting files, and try again.
5. Set `config config --local status.showUntrackedFiles no` on the local
   repository

## General information

### Adding files to be backed up (git add)
`config add <file>`

### Uploading the files to the remote (git push)
`config push`
