
# Foretager en masse setup på en ny computer
# Først og fremmest kræves nextcloud allerede sat op
# Dernæst skal denne fil sættes til at køre på opstart
# Kræver genstart efter kørsel

SCRIPTPATH=~/environment-setup

git config --global credential.helper store

# Installerer zsh
yes y | sudo pacman -S zsh
chsh -s $(which zsh)

# tmux config
ln -S ~/environment-setup

# Sætter .*rc-fil op
echo "source ~/environment-setup/.zshrc" > ~/.zshrc

# Installerer ting
sudo pacman -S base-devel
sudo pacman -S xdotool
yay -Syy grabc
yay -Syy antibody-bin
yay -Syy ld-lsb
yay -Syy libselinux
yay python-llvmlite-bin

# Sætter latexting op
yay texlive  # 1-3, 10
yay texlive-pictures
sudo pacman -S texstudio

git clone https://github.com/asgerius/latex-utilities.git ~/Desktop/latex-utilities
cd ~/Desktop/latex-utilities
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

# Installer Python
# vpython="3.9.1"
yay pyenv
pyenv install 3.9.1
pyenv shell 3.9.1
pyenv global 3.9.1
# mvpython="3.9"
# sudo pacman -S tk
# cd ~/Downloads
# wget https://www.python.org/ftp/python/$vpython/Python-$vpython.tar.xz
# tar xf Python-$vpython.tar.xz
# rm Python-$vpython.tar.xz
# cd Python-$vpython
# sudo ./configure --enable-optimizations
# sudo make altinstall
# sudo ln -sf /usr/local/bin/python$mvpython /usr/local/bin/python3
# sudo ln -sf /usr/local/bin/pip$mvpython /usr/local/bin/pip3
# alias python="/usr/local/bin/python3"
# alias pip="/usr/local/bin/pip3"
pip install --upgrade pip
pip install wheel
pip install -r $SCRIPTPATH/requirements.txt
pip install numba
pip install torch==1.7.1+cpu torchvision==0.8.2+cpu torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
cd ~

# Sætter vs code op (antager allerede installeret)
cp $SCRIPTPATH/vs-code/* ~/.config/Code/User

# Sætter .zshrc op
echo "source ~/environment-setup/.zshrc" >> ~/.zshrc

# Kører opstart
cd $SCRIPTPATH
mkdir ~/bin
chmod +x start.sh
./start.sh

source ~/.zshrc
plugins

