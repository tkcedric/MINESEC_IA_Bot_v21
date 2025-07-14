#!/bin/bash
# Installer les dépendances système
apt-get update
apt-get install -y pandoc texlive-xetex texlive-latex-base texlive-latex-extra dvipng cm-super fonts-liberation fonts-dejavu

# Configurer les polices
mkdir -p /usr/share/fonts/truetype/custom
ln -s /usr/share/fonts/truetype/liberation /usr/share/fonts/truetype/custom/
fc-cache -f -v

# Installer les dépendances Python
pip install -r requirements.txt

# Convertir le notebook en script (sécurité)
jupyter nbconvert --to script minesec_bot.ipynb