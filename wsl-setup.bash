set -e

bash install/wsl-libs.sh
bash install/zsh.sh
zsh install/pyenv.zsh

git config --global user.name "Asger Schultz"
git config --global user.email "asger.s@pm.me"
git config --global pull.rebase true
git config --global alias.fukd "push -f"
git config --global core.editor nano
