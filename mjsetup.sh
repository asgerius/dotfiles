
# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal denne fil sættes til at køre på opstart
# Kræver genstart efter kørsel

git config --global user.email "asger.s@protonmail.com"
git config --global user.name "Asger Schultz"
git config --global pull.rebase true
git config --global credential.helper store
git config --global alias.fukd "push -f"

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
yay texlive-most
sudo pacman -S texstudio

# Open texstudio before this step
git clone git@github.com:asgerius/latex-utilities.git ~/latex-utilities
cd ~/latex-utilities
chmod +x setup.py
chmod +x update-tex
python3 setup.py

TEXMF=~/texmf/tex/latex/local
mkdir -p $TEXMF
cd $TEXMF
mkdir SpeedyGonzales MediocreMike Blastoise
cp ~/latex-utilities/SpeedyGonzales.sty SpeedyGonzales
cp ~/latex-utilities/MediocreMike.sty MediocreMike
cp ~/latex-utilities/Blastoise.sty Blastoise

# Opretter bin
cd ~
mkdir -p bin

# Steder til ssh-mapper
mkdir ~/hpc
mkdir ~/hpc-work3

# Sætter .zshrc op
echo "source ~/environment-setup/.zshrc" > ~/.zshrc
. ~/environment-setup/zsh/functions
source ~/.zshrc
plugins
src

# Installer Python
sudo pacman -S tk
yay pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
src
vpython=3.11.5
pyenv install 3.7.12
pyenv install $vpython
pyenv shell $vpython
pyenv global $vpython
pip install --upgrade pip
pip install wheel
# Virtuelt miljø
pyenv virtualenv 3.7.12 pelutils
# CUDA
# pip install torch torchvision torchaudio --upgrade --no-cache-dir
# CUDA on AMD
# echo "export HSA_OVERRIDE_GFX_VERSION=10.3.0" >> ~/.zshrc
# pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm5.4.2

# Sætter vs code op (antager allerede installeret)
cp ~/environment-setup/vs-code/* ~/.config/Code/User

# Kører opstart
cd ~/environment-setup
chmod +x start.sh
./start.sh

# Programmer
yay signal-desktop
yay discord
yay teams
yay slack-desktop
yay spotify
