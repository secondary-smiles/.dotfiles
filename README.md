# dotfiles

## Setting up a new Mac

- Install Developer tools

```bash
xcode-select --install
```

> Required for git and most other terminal tools to work

- Clone this repo

```bash
cd # go to home folder, this is IMPORTANT
git clone https://github.com/secondary-smiles/.dotfiles $HOME/.dotfiles.git
```

- Install OhMyZSH

```bash

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

> OhMyZSH is the terminal I'm used to

- Install Brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> Brew is how I install most of my software

- Install the Brewfile

```bash
brew bundle --file=$HOME/.dotfiles/core/Brewfile
```

> This is almost certainly going to take a really long time

- Symlink my most important dotfiles

```bash
ln -sf $HOME/.dotfiles/core/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/core/.gitconfig $HOME/.gitconfig

# Neovim init file
mkdir -p $HOME/.config/nvim
ln -sf $HOME/.dotfiles/core/init.vim $HOME/.config/nvim/init.vim

# CoC settings file
ln -sf $HOME/.dotfiles/core/coc-settings.json $HOME/.config/nvim/coc-settings.json
```

> These files are how I make things look good in my workflow

- Install Vim-Plug and Vundle

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim
```

> These are my package managers for Neovim and they make everything look so nice

- Set wallpaper

```bash
osascript -e 'tell application "Finder" to set desktop picture to (do shell script "echo $HOME/.dotfiles/wallpaper/wallpaper.jpg") as POSIX file'
```

> Doing it through the terminal makes us so much cooler

- Link my movie_lists folder

```bash
ln -sf $HOME/.custom_lists $HOME/.custom_lists
```

> I keep all the movies I want to watch here

- Install and compile my movie_lists program

```bash
git clone https://github.com/secondary-smiles/movie_list.git
clang++ $HOME/movie_list/main.cpp -o $HOME/list

sudo install $HOME/list /usr/bin/list
```
