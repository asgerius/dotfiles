cd "$(dirname "$0")"
git pull > /dev/null 2>&1 &

ENDLOSUNG=~/Desktop/latex-utilities
TEXMF=~/texmf/tex/latex/local

# tex-filer
cd $ENDLOSUNG
git pull > /dev/null 2>&1 &
python3 latexer/sync.py
cp -rf macro/* ~/.config/texstudio/macro
cp texstudio.ini ~/.config/texstudio/texstudio.ini
chmod +x latexer/main.pyw
cp -f SpeedyGonzales.sty $TEXMF/SpeedyGonzales/SpeedyGonzales.sty
cp -f MediocreMike.sty $TEXMF/MediocreMike/MediocreMike.sty
cp -f Blastoise.sty $TEXMF/Blastoise/Blastoise.sty

# bin-filer
cp $ENDLOSUNG/convert-to-table.py ~/bin
mv ~/bin/convert-to-table.py ~/bin/ctt
chmod +x ~/bin/ctt

cp ~/environment-setup/extra-files/* ~/bin
chmod +x -R ~/bin/

cc-clear

raspberry_ip=10.42.0.208
# TODO: Make this try except
sshfs -o allow_other,default_permissions pi@$raspberry_ip:/ ~/raspberry
