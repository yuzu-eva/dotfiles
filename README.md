# Dotfiles Repository

My personal dotfiles repository.

## lspconfig requirements

works on npm 8.10.0 + nodejs 16.13.1 and later

```bash
npm i -g vscode-langservers-extracted
npm i -g typescript typescript-language-server
npm i -g bash-language-server
npm i -g emmet-ls
pip3 install jedi
pip3 install python-lsp-server[all]
gem install solargraph

```

## Treesitter

Remember to TSInstall the languages. Currently using:

* bash
* c
* html
* javascript
* json
* lua
* python
* ruby
* tsx
* typescript
* vim
* markdown

## Powerline

.bashrc expects local installation:

```bash
pip3 install --user powerline-status
pip3 install --user powerline-gitstatus

```

## Kitty

Using Hack Nerd Font
