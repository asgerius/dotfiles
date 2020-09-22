cd "$(dirname "$0")"
git pull > /dev/null 2>&1 &

ENDLOSUNG=$HOME/Desktop/latex-utilities
TEXMF=$HOME/texmf/tex/latex/local

# tex-filer
cd $ENDLOSUNG
git pull > /dev/null 2>&1 &
python3 latexer/sync.py
cp -rf macro/* $HOME/.config/texstudio/macro
cp texstudio.ini $HOME/.config/texstudio/texstudio.ini
chmod +x latexer/main.pyw
cp -f SpeedyGonzales.sty $TEXMF/SpeedyGonzales/SpeedyGonzales.sty
cp -f MediocreMike.sty $TEXMF/MediocreMike/MediocreMike.sty
cp -f Blastoise.sty $TEXMF/Blastoise/Blastoise.sty

# bin-filer
cp $ENDLOSUNG/convert-to-table.py $HOME/bin
mv $HOME/bin/convert-to-table.py $HOME/bin/ctt
chmod +x $HOME/bin/ctt

cp $HOME/Nextcloud/Programmering/Start-scripts/mj-filer/* $HOME/bin
chmod +x -R $HOME/bin/

cc-clear

raspberry_ip=10.42.0.208
sshfs -o allow_other,default_permissions pi@$raspberry_ip:/ ~/raspberry
