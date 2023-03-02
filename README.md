# dotfiles

## Inspiration
inspired by this [article](https://www.atlassian.com/git/tutorials/dotfiles) i have created a bare gitrepo of my own configuration used with my macbook on daily basis.

## How to share
If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines

```sh
cd $HOME
git init —bare $HOME/.bare_cfg
alias config='/usr/bin/git --git-dir=$HOME/.bare_cfg/ --work-tree=$HOME' 
# put this alias also in .alias or .zshrc
config config --local status.showUntrackedFiles no
````
After that you can versioning any file under $HOME with the normal git commands you know. But with the alias **config** instead of git.

```sh
config status
config add .vimrc
config commit -m "vimrc added"
````
push to repo

```sh
config remote add origin https://github.com/rmerfeld/dotfiles.git
config config --local push.autoSetupRemote true
config push
```

