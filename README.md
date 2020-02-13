Files are explanied briefly below. Contributions and suggestions/issues are always welcome.

## Zsh

[Setup script](zsh/setup.sh) does the following:

- Installs zsh to path
- Clones [zsh repository](https://github.com/robbyrussell/oh-my-zsh) to `$HOME/.oh-my-zsh`
- Copies .zprofile and .zshrc to `$HOME`
- Asks you if you want to make zsh your default shell

**Note:** You can't use this on Windows.


## Bash

[Setup script](bash/setup.sh) copies .bash_profile and .bashrc to `$HOME`.


## Vim

[Setup script](vim/setup.sh) does the following:

- Copies config files according to your OS
- Installs colorschemes from [github/awesome-vim-colorschemes](https://github.com/rafi/awesome-vim-colorschemes)


## SSH

Contains template of [config file](ssh/template.config) with explanations.


## PyPI

Contains templates:

- [.pypirc](pypi/template.pypirc)
- [Example script](pypi/upload.sh) that uploads to test index.
