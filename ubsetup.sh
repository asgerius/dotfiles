
# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal denne fil sættes til at køre på opstart
# Kræver genstart efter kørsel

SCRIPTPATH=~/environment-setup
cd ~

git config --global credential.helper store

# Installerer zsh
sudo apt install zsh
chsh -s $(which zsh)

# Udviklingsting
sudo apt install build-essential libbz2-dev libssl-dev libreadline-dev libffi-dev

# Sætter .*rc-fil op
echo "source ~/environment-setup/.zshrc" > ~/.zshrc

# Installerer ting
sudo apt install xdotool grabc
cd ~/Downloads
wget https://github.com/getantibody/antibody/releases/download/v6.0.1/antibody_6.0.1_linux_386.deb
sudo apt install ./antibody_6.0.1_linux_386.deb
cd ~

# Python-ting
sudo apt-get install -y python3-venv python3-wheel python3-dev
sudo apt-get install -y libgirepository1.0-dev build-essential \
  libbz2-dev libreadline-dev libssl-dev zlib1g-dev libsqlite3-dev wget \
  curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libcairo2-dev

# Sætter latexting op
git clone https://github.com/asgerius/latex-utilities.git ~/Desktop/latex-utilities
cd ~/Desktop/latex-utilities
chmod +x setup.py
chmod +x update-tex
python3 setup.py

TEXMF=$HOME/texmf/tex/latex/local
mkdir -p $TEXMF
cd $TEXMF
mkdir SpeedyGonzales MediocreMike Blastoise

# Opretter bin
cd $HOME
mkdir -p bin

# Kører opstart
cd $SCRIPTPATH
chmod +x start.sh
./start.sh

sudo locale-gen "da_DK.UTF-8"
