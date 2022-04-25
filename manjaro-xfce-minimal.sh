#!/bin/bash
chmod +x manjaro-xfce-minimal.sh

function main() {
  # setup-initial
  # setup-theme
  # setup-terminal
  # install-development-dependencies
}

# ------------------------------------------------------------------------------
# 
# ------------------------------------------------------------------------------

function setup-initial() {
  sudo pacman -Syyuu --noconfirm
  sudo pamac upgrade -a --noconfirm
  sudo pacman -S git base-devel pacman-contrib yay --noconfirm
  sudo pacman -R midori parole --noconfirm

  sudo systemctl enable fstrim.timer
  sudo systemctl enable sshd.service
  sudo systemctl start sshd.service
}

function setup-terminal() {
  yay -S --noconfirm zsh
  yay -S --noconfirm zsh-theme-powerlevel10k-git
  echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc  

  sudo pacman -S ttf-meslo-nerd-font-powerlevel10k --nocofirm
  # Change Default Shell To (zsh)

  cd $HOME
  mkdir .zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> .zshrc

  chsh -s /usr/bin/zsh
}

function install-development-dependencies() {
  yay -S asdf-vm --noconfirm
  echo "source /opt/asdf-vm/asdf.sh" >> .zshrc

  # Reset

  # Nodejs
  asdf plugin add nodejs
  asdf install nodejs 18.0.0
  asdf global nodejs 18.0.0

  # Java
  asdf plugin-add java https://github.com/halcyon/asdf-java.git
  asdf install java zulu-8.0.0.3
  asdf global java zulu-8.0.0.3

  # Grails
  asdf plugin-add grails https://github.com/weibemoura/asdf-grails.git
  asdf install grails 3.3.5

  # Groovy
  asdf plugin-add groovy https://github.com/weibemoura/asdf-groovy.git

}


# ------------------------------------------------------------------------------
# 
# ------------------------------------------------------------------------------

function color-print() {
  local colorParam="$1"
  local message="$2"

  case $colorParam in 
    "-red)" '\033[31m'$message'\033[m'  ;;
    "-green") echo -e '\033[32m'$message'\033[m'  ;;
    "-blue")  echo -e '\033[34m'$message'\033[m' ;;
    "-white") echo -e '\033[37m'$message'\033[m'  ;; 
    *) return ;;
  esac

  sleep 1 
}

# ------------------------------------------------------------------------------
# 
# ------------------------------------------------------------------------------

function install-docker() {
  yay -S docker --noconfirm
}

function install-browsers() {
  yay -S google-chrome --noconfirm
}

function ssh-key() {
  ssh-keygen -t rsa -b 4096 "email@mail.com"
}

function install-code-editors() {
  yay -S intellj-idea-ultimate-edition --noconfirm
}

main

:'

Theme: Dracula ( https://xfce-look.org/p/1687249 )
Icons: Papirus Dark

'