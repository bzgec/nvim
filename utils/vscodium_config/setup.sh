#!/bin/bash

extension_install() { vscodium --install-extension "$@"; }

extensionsArr=(
    "asciidoctor.asciidoctor-vscode"
    "streetsidesoftware.code-spell-checker"
    "anseki.vscode-color"
    "eamodio.gitlens"
    "bierner.markdown-preview-github-styles"
    "davidanson.vscode-markdownlint"
    "asvetliakov.vscode-neovim"
    "medo64.render-crlf"
    "dunstontc.viml"
    "VSpaceCode.whichkey"
)

# Install extensions
for extension in "${extensionsArr[@]}"; do
    extension_install "$extension"
done

# Copy settings.json and keybindings.json
cp settings.json ~/.config/VSCodium/User/
cp keybindings.json ~/.config/VSCodium/User/
