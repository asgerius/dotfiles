#!/usr/bin/zsh
cd ~/environment-setup
git pull

ENDLOSUNG=~/Desktop/latex-utilities
TEXMF=~/texmf/tex/latex/local

xmodmap -e "keycode 110 = Delete"

# tex-filer
cd $ENDLOSUNG
git pull
python3 latexer/sync.py
yes | cp -rf macro/* ~/.config/texstudio/macro
yes | cp -f texstudio.ini ~/.config/texstudio/texstudio.ini
chmod +x latexer/main.pyw
yes | cp -f SpeedyGonzales.sty $TEXMF/SpeedyGonzales/SpeedyGonzales.sty
yes | cp -f MediocreMike.sty $TEXMF/MediocreMike/MediocreMike.sty
yes | cp -f Blastoise.sty $TEXMF/Blastoise/Blastoise.sty

# bin-filer
yes | cp $ENDLOSUNG/convert-to-table.py ~/bin
yes | mv ~/bin/convert-to-table.py ~/bin/ctt
chmod +x ~/bin/ctt

yes | cp ~/environment-setup/extra-files/* ~/bin
chmod +x -R ~/bin/

cc-clear
