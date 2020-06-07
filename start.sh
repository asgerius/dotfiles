cd "$(dirname "$0")"
git pull > /dev/null 2>&1 &

ENDLOSUNG=$HOME/Desktop/latex-utilities

# tex-filer
cd $ENDLOSUNG
git pull > /dev/null 2>&1 &
python3 $ENDLOSUNG/latexer/sync.py
cp -rf $ENDLOSUNG/macro/* $HOME/.config/texstudio/macro
cp $ENDLOSUNG/texstudio.ini $HOME/.config/texstudio/texstudio.ini
chmod +x $ENDLOSUNG/latexer/main.pyw

# bin-filer
cp $ENDLOSUNG/convert-to-table.py $HOME/bin
mv $HOME/bin/convert-to-table.py $HOME/bin/ctt
chmod +x $HOME/bin/ctt

cp $HOME/Nextcloud/Programmering/Start-scripts/mj-filer/* $HOME/bin
chmod +x -R $HOME/bin/

cc-clear

