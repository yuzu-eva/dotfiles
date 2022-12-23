# Dotfiles Repository

My personal dotfiles repository.  
Listed commands work on debian.  

## nvim

### lspconfig requirements

works on npm 8.10.0 + nodejs 16.13.1 and later.

My lspconfig uses language servers for:

- Bash
- C
- css
- html
- JavaScript / TypeScript
- Lua
- Python

The following command block can be copy-pasted into a bash terminal.  
It will install all requirements needed for the lspconfig to work.  
May need super user privilege.

Requires npm, pip3, ruby and git.

```bash
npm i -g bash-language-server
npm i -g emmet-ls
pip3 install jedi
pip3 install python-lsp-server
sudo apt-get install clangd-13
git clone  --depth=1 https://github.com/sumneko/lua-language-server ~/.local/src/lua-language-server
cd ~/.local/src/lua-language-server
git submodule update --depth 1 --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
cd
```

### Treesitter

Remember to TSInstall *

## st

My build of [st](https://github.com/yuzu-eva/my-personal-st).

## dmenu

My build of [dmenu](https://github/yuzu-eva/my-personal-dmenu).

## Window Manager

My build of [dwm](https://github.com/yuzu-eva/my-personal-dwm).

## File Manager

Using this very rarely, mainly just for comfy renaming of files.

Using nnn with preview-tabbed plugin.
