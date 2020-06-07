
# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal denne fil sættes til at køre på opstart
# Kræver genstart efter kørsel

SCRIPTPATH=~/environment-setup
cd $HOME

git config --global credential.helper store

# Installerer zsh
sudo apt install zsh
chsh $(which zsh)

# Sætter .*rc-fil op
echo "source ~/environment-setup/.zshrc" > ~/.zshrc

# Installerer ting
sudo apt install xdotool grabc antibody

# Sætter latex-config op
git clone https://github.com/asgerius/latex-utilities.git ~/Desktop/latex-utilities
cd ~/Desktop/latex-utilities
chmod +x setup.py
chmod +x update-tex
python3 setup.py

# Opretter bin
cd $HOME
mkdir -p bin

# Kører opstart
cd $SCRIPTPATH
chmod +x start.sh
./start.sh
