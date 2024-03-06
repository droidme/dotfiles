# dotfiles
inspired by this [article](https://www.atlassian.com/git/tutorials/dotfiles) i have created a bare gitrepo of my own configuration that i use on my macbook on a daily basis.

## How to Share
If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines

```sh
cd $HOME
git init —bare $HOME/.bare_cfg
# put this alias also in .alias or .zshrc
alias config='/usr/bin/git --git-dir=$HOME/.bare_cfg/ --work-tree=$HOME' 
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

## How to Migrate
if you want to install/migrate your dotfiles to a new system, follow these steps.
Put this alias into your prefered shell.

```sh
alias config='/usr/bin/git --git-dir=$HOME/.bare_cfg/ --work-tree=$HOME'
# and also update your .gitignore
echo ".bare_cfg" >> .gitignore
```

Now you can clone your dotfiles into the bare repo.

```sh
git clone --bare https://github.com/rmerfeld/dotfiles.git $HOME/.bare_cfg
```

and checkout the configs to your $HOME

```sh
config checkout
````
The step above might fail if config files already exists. Simple solution is remove them if you don't care, otherwise backup them.

## Steps after Migration

### neovim
```sh
brew install nvim
``

[mason-lspconfig.nvim] failed to install angularls. Installation logs are available in :Mason and :MasonLog
[mason-lspconfig.nvim] failed to install bashls. Installation logs are available in :Mason and :MasonLog
[mason-lspconfig.nvim] failed to install html. Installation logs are available in :Mason and :MasonLog
[mason-lspconfig.nvim] failed to install cssls. Installation logs are available in :Mason and :MasonLog
[mason-lspconfig.nvim] failed to install tailwindcss. Installation logs are available in :Mason and :MasonLog

[mason-lspconfig.nvim] installing bashls
[mason-lspconfig.nvim] installing html
[mason-lspconfig.nvim] installing tsserver
[mason-lspconfig.nvim] installing cssls
[mason-lspconfig.nvim] installing tailwindcss
[mason-lspconfig.nvim] installing emmet_ls


### oh-mysh
[oh-my-zsh] plugin 'zsh-autosuggestions' not found
[oh-my-zsh] plugin 'zsh-syntax-highlighting' not found
[oh-my-zsh] theme 'powerlevel10k/powerlevel10k' not found

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```






