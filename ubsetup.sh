
# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal denne fil sættes til at køre på opstart
# Kræver genstart efter kørsel

SCRIPTPATH=~/environment-setup
cd $HOME

git config --global credential.helper store

# Installerer zsh
sudo apt install zsh
chsh -s $(which zsh)

# Sætter .*rc-fil op
echo "source ~/environment-setup/.zshrc" > ~/.zshrc

# Installerer ting
sudo apt install xdotool grabc
cd ~/Downloads
wget https://github.com/getantibody/antibody/releases/download/v6.0.1/antibody_6.0.1_linux_386.deb
sudo apt install ./antibody_6.0.1_linux_386.deb
cd ~

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
