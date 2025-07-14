#!/bin/bash
apt-get update
apt-get install -y pandoc texlive-xetex texlive-latex-base texlive-latex-extra dvipng cm-super fonts-liberation fonts-dejavu
mkdir -p /usr/share/fonts/truetype/custom
ln -s /usr/share/fonts/truetype/liberation /usr/share/fonts/truetype/custom/
fc-cache -f -v
pip install -r requirements.txt
echo "Vérification des polices..."
fc-list | grep DejaVu