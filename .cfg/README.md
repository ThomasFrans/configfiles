# Dotfiles

Dotfiles used across multiple Linux machines. (I sure hope I don't upload my ssh
keys by accident :D)

## Backup

1. Clone the repository into the home directory with 
   `git clone --bare <git-repo-url> $HOME/.cfg`
2. Checkout the content from the remote with `config checkout`
3. If step 3 fails, try removing the conflicting files, and try again.
4. Set `config config --local status.showUntrackedFiles no` on the local
   repository

## General information

### Adding files to be backed up (git add)
`config add <file>`

### Uploading the files to the remote (git push)
`config push`
