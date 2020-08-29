
# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal denne fil sættes til at køre på opstart
# Kræver genstart efter kørsel

SCRIPTPATH=~/environment-setup
cd $HOME

git config --global credential.helper store

# Installerer zsh
yes y | sudo pacman -S zsh
chsh -s $(which zsh)

# Sætter .*rc-fil op
echo "source ~/environment-setup/.zshrc" > ~/.zshrc

# Installerer ting
yes y | sudo pacman -S xdotool
yes n | yay -Syy grabc
yes n | yay -Syy antibody-bin

# Sætter latexting op
yes "1-3, 10" | yay texlive
yes y | sudo pacman -S texstudio

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

# Installer Python
vpython="3.8.5"
mvpython="3.8"
cd ~/Downloads
wget https://www.python.org/ftp/python/$vpython/Python-$vpython.tar.xz
tar xf Python-$vpython.tar.xz
cd Python-$vpython
sudo ./configure --enable-optimizations
sudo make altinstall
sudo ln -s /usr/local/bin/python$mvpython /usr/local/bin/python3
sudo ln -s /usr/local/bin/pip$mvpython /usr/local/bin/pip3
cd ~

# Kører opstart
cd $SCRIPTPATH
chmod +x start.sh
./start.sh

source ~/.zshrc
plugins

