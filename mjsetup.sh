# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal denne fil sættes til at køre på opstart
# Kræver genstart efter kørsel

# Installerer nogle grundlæggende ting
sudo pacman -Syu
sudo pacman -S base-devel
sudo pacman -S yay
yay
yay visual-studio-code-bin

# Konfigurerer git
git config --global user.email "asger.s@protonmail.com"
git config --global user.name "Asger Schultz"
git config --global pull.rebase true
git config --global alias.fukd "push -f"
git config --global core.editor nano

# Sætter yay op og opdaterer (antager allerede installeret)
yay --save --answerclean n --answerdiff n --answeredit n --answerupgrade a

# Programmer
yay nextcloud-client
yay signal-desktop
yay discord
yay spotify

# Installerer ting
sudo pacman -S base-devel
sudo pacman -S xdotool
sudo pacman -S ld-lsb
sudo pacman -S unzip
yay grabc
yay antibody-bin
yay libselinux

# Sætter latexting op
yay texlive-most
sudo pacman -S biber
sudo pacman -S texstudio
texstudio

git clone git@github.com:asgerius/latex-utilities.git ~/latex-utilities
cd ~/latex-utilities
chmod +x setup.py
chmod +x update-tex
python setup.py

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

# Sætter .zshrc op
chsh -s $(which zsh)
echo "source ~/environment-setup/.zshrc" > ~/.zshrc
source ~/.zshrc
# Genstart skal, før følgende køres
plugins
src

# Installer Python
sudo pacman -S python-pipx
sudo pacman -S python-pyserial
sudo pacman -S tk
sudo pacman -S pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
src
pyenv install 3.9.7
pyenv virtualenv 3.9.7 pelutils
vpython=3.13.1
pyenv install $vpython
pyenv shell $vpython
pyenv global $vpython
pip install --upgrade pip
pip install wheel ipdb
src

# Sætter vs code op
cp ~/environment-setup/vs-code/* ~/.config/Code/User

# Kører opstart
cd ~/environment-setup
chmod +x start.sh
./start.sh
