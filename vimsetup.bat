cd C:\Users\jthig
ren vimfiles vimfiles.bk
mklink /D C:\Users\jthig\vimfiles C:\Users\jthig\.dotfiles\.vim
ren _vimrc _vimrc.bk
mklink C:\Users\jthig\_vimrc C:\Users\jthig\.dotfiles\.vimrc
ren .vimrc .vimrc.bk
mklink C:\Users\jthig\.vimrc C:\Users\jthig\.dotfiles\.vimrc
ren .gitconfig .gitconfig.bk
mklink C:\Users\jthig\.gitconfig C:\Users\jthig\.dotfiles\.gitconfig
ren .bashrc .bashrc.bk
mklink C:\Users\jthig\.bashrc C:\Users\jthig\.dotfiles\.bashrc
attrib -h .bash_aliases
attrib -h .\.dotfiles\.bash_aliases
ren .bash_aliases .bash_aliases.bk
mklink C:\Users\jthig\.bash_aliases C:\Users\jthig\.dotfiles\.bash_aliases
cd C:\Users\jthig\AppData\Local\nvim
ren pack pack.bk
ren init.vim init.vim.bk
mklink /D C:\Users\jthig\AppData\Local\nvim\pack C:\Users\jthig\.dotfiles\.vim\pack
mklink C:\Users\jthig\AppData\Local\nvim\init.vim C:\Users\jthig\.dotfiles\.vim\init.vim
