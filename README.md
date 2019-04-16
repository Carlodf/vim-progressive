# vim-progressive
vim8 configuration

## Install
```
git clone --recurse-submodules -j8 git@github.com:Carlodf/vim-progressive.git
~/.vim
```
If already cloned and missing the sub modules (plug ins):

```
cd ~/.vim
git submodule update --init --recursive
```

## Custom Settings

- colour scheme [solarized](https://github.com/altercation/vim-colors-solarized)

- toggle viewport "full screen"/"equalize"                     `<leader>tf`

- create diff of changed buffer with original file              `:DiffOrigin`

- Go to file opens in a vertical split                          `<leader>gf`

## Plug ins:

- [vim-fugitive](https://github.com/tpope/vim-fugitive)
