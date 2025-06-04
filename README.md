# work_station_config

Configuration for my workstation

# Installation

Things to do to setup a machine from a clean Ubuntu/Pop!_OS install:
- Generate an SSH key pair and add it to GitHub
- Download my password archive
- Download and install the nerdfont-patched FireCode font from [here](https://github.com/ryanoasis/nerd-fonts/)
- Install all the dependencies with the script below
    ```bash
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CC86BB64
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo add-apt-repository ppa:rmescandon/yq
    sudo apt-get update
    sudo apt-get install -y neovim keepassxc fzf fd-find zoxide tree tldr jq yq stow ripgrep
    tldr --update
    git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
    sudo chown --recursive root:root /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com/
    gnome-extensions enable clipboard-indicator@tudmotu.com
    curl -sS https://starship.rs/install.sh | sh
    curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - && sudo apt-get install -y nodejs
    sudo apt install python3-pip
    pip3 install jedi-language-server
    sudo cp ~/.local/bin/jedi-language-server /usr/bin/
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty --title kitty|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|TryExec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    ```
- Setup my bash aliases and all other config as explained above
    ```bash
    rm ~/.bashrc
    stow --ignore=\.git.\* --target ~
    ```
    (to deploy only one package, use `stow --target=$HOME/.config/jj jj --verbose` for example)
- Install Docker and perform the installation step to not have to use `sudo` each time
- Install uLauncher and extensions:
    - the [firefox extension](https://github.com/KuenzelIT/ulauncher-firefox-bookmarks)
    - the [window switcher extension](https://github.com/beajeanm/ulauncher-windows-switcher)
- Configure the tiling manager to enable tiling by default, and add an exception for uLauncher
- Remove LibreOffice
    ```bash
    sudo apt-get remove --purge libreoffice*
    sudo apt-get autoremove
    ```
