
# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal denne fil sættes til at køre på opstart
# Kræver genstart efter kørsel

git config --global user.email "asger.s@protonmail.com"
git config --global user.name "Asger Schultz"
git config --global pull.rebase true
git config --global credential.helper store
git config --global alias.fukd "push -f"
echo """
[alias]
lg1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
lg = !"git lg1"
""" >> ~/.gitconfig

# Installerer zsh
yes y | sudo pacman -S zsh
chsh -s $(which zsh)

# tmux config
ln -S ~/environment-setup

# Installerer ting
sudo pacman -S base-devel
sudo pacman -S xdotool
yay -Syy grabc
yay -Syy antibody-bin
yay -Syy ld-lsb
yay -Syy libselinux
yay python-llvmlite-bin
yay unzip

# Sætter latexting op
sudo pacman -S texlive-most
sudo pacman -S texstudio

# Open texstudio before this step
git clone https://github.com/asgerius/latex-utilities.git ~/latex-utilities
cd ~/latex-utilities
chmod +x setup.py
chmod +x update-tex
python3 setup.py

TEXMF=~/texmf/tex/latex/local
mkdir -p $TEXMF
cd $TEXMF
mkdir SpeedyGonzales MediocreMike Blastoise

# Opretter bin
cd ~
mkdir -p bin

# Steder til ssh-mapper
mkdir ~/hpc
mkdir ~/hpc-work3
mkdir ~/raspberry-pi

# Installer Python
sudo pacman -S tk
yay pyenv
vpython="3.9.7"
pyenv install 3.7.12
pyenv install $vpython
pyenv shell $vpython
pyenv global $vpython
pip install --upgrade pip
pip install wheel
pip install --upgrade -r ~/environment-setup/requirements.txt
pip install numba
pip install --upgrade numpy
pip install wikipedia2vec==1.0.4
# CPU
pip install torch==1.9.0+cpu torchvision==0.10.0+cpu torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html
# CUDA
# pip install torch torchvision torchaudio
# ROCM
# pip install torch -f https://download.pytorch.org/whl/rocm4.2/torch_stable.html
# pip install torchvision==0.10.0 -f https://download.pytorch.org/whl/rocm4.2/torch_stable.html

# Sætter vs code op (antager allerede installeret)
cp ~/environment-setup/vs-code/* ~/.config/Code/User

# Sætter .zshrc op
echo "source ~/environment-setup/.zshrc" >> ~/.zshrc

# Kører opstart
cd ~/environment-setup
chmod +x start.sh
./start.sh

source ~/.zshrc
plugins

# Flutter
cd ~
git clone https://github.com/flutter/flutter.git -b stable
flutter doctor

# Kommunikation
yay signal-desktop
yay discord
yay teams
yay slack-desktop

# Diverse programmer
yay spotify
yay nextcloud-client
