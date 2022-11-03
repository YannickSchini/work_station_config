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
    sudo add-apt-repository ppa:rmescandon/yq ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install -y neovim keepassxc fzf fd-find zoxyde tree tldr jq yq stow
    tldr --update
    git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
    sudo chown --recursive root:root /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com/
    gnome-extensions enable clipboard-indicator@tudmotu.com
    curl -sS https://starship.rs/install.sh | sh
    ```
- Setup my bash aliases and all other config as explained above
    ```bash
    rm ~/.bashrc
    stow --ignore=\.git.\* --target ~
    ```
- Install Docker and perform the installation step to not have to use `sudo` each time
- Install uLauncher and the firefox extension
- Configure the tiling manager to enable tiling by default, and add an exception for uLauncher
