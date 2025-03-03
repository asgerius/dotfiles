set -e

chsh -s $(which zsh)
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
zsh -c "source ./zsh/functions && plugins"
echo "source $(pwd)/.zshrc" > ~/.zshrc
