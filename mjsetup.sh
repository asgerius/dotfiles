
# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal Start-scripts.pyw sættes til at køre på opstart
# Kræver genstart efter kørsel

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Installerer oh-my-zsh
sudo pacman -Sy zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh $(which zsh)

# Installerer ting
yay -S xdotool grabc

# Opretter stier til latex-ting
TEXMF=$HOME/texmf/tex/latex/local
mkdir -p $TEXMF
cd $TEXMF
mkdir SpeedyGonzales MediocreMike Blastoise

# Sætter latex-config op
cd $HOME/Desktop
git clone https://github.com/asgerius/latex-utilities.git
cd EndLosung
chmod +x setup.py
chmod +x update-tex
python setup.py

# Opretter bin
cd $HOME
mkdir -p bin

# Kører opstart
cd $SCRIPTPATH
chmod +x Start-scripts.pyw
chmod +x mjstart.sh
./start.sh

