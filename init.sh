#!/usr/bin/env bash

function run() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    echo ""
    echo "------------------------------"
    echo "Configure zsh and oh-my-zsh."
    echo "------------------------------"
    echo ""
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    cp nick.zsh-theme ~/.oh-my-zsh/themes
    sed -i '' 's/^ZSH_THEME=.*$/ZSH_THEME="nick"/' ~/.zshrc

    echo ""
    echo "------------------------------"
    echo "Copying dotfiles to home directory."
    echo "------------------------------"
    echo ""
    for file in dotfiles/*; do
        base=$(basename "$file")
        echo "$file"
        if [ -e ~/".$base" ]; then
            read -p "~/.$base already exists. Do you want to overwrite it? (y/n) " -n 1 -r
            echo    # move to a new line
            if [[ ! $REPLY =~ ^[Yy]$ ]]
            then
                continue
            fi
        fi
        
        echo "Writing ~/.$base"
        cp -R "$file" ~/".$base"
    done


    # Run the brew.sh Script
    # For a full listing of installed formulae and apps, refer to
    # the commented brew.sh source file directly and tweak it to
    # suit your needs.
    echo ""
    echo "------------------------------"
    echo "Installing Homebrew along with some common formulae and apps."
    echo "This might take a while to complete, as some formulae need to be installed from source."
    echo "------------------------------"
    echo ""
    ./brew.sh

    # Run the macos.sh Script
    # I strongly suggest you read through the commented osx.sh
    # source file and tweak any settings based on your personal
    # preferences. The script defaults are intended for you to
    # customize. For example, if you are not running an SSD you
    # might want to change some of the settings listed in the
    # SSD section.
    echo ""
    echo "------------------------------"
    echo "Setting sensible macos defaults."
    echo "------------------------------"
    echo ""
    ~/.macos

    echo "------------------------------"
    echo "Completed running .dots, restart your computer to ensure all updates take effect"
    echo "------------------------------"
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    run
fi;
