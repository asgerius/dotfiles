
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
yay -Syy antibody-bin

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
