#!/bin/bash
set -e  # Arrête le script en cas d'erreur

# 1. Installation des dépendances système
echo "🔧 Installation des dépendances système..."
apt-get update && apt-get install -y \
    pandoc \
    texlive-xetex \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    fonts-liberation \
    fonts-dejavu \
    lmodern \
    python3-pip \
    python3-venv \
    jupyter-core \
    nbconvert

# 2. Configuration des polices
echo "🔠 Configuration du cache de polices..."
fc-cache -fv

# 3. Conversion du notebook en script Python
echo "🔄 Conversion du notebook en script Python..."
jupyter nbconvert --to python minesec_bot.ipynb --output-dir=. --output=minesec_bot.py

# 4. Installation des dépendances Python
echo "🐍 Installation des dépendances Python..."
pip install --upgrade pip
pip install -r requirements.txt

# 5. Vérification des installations
echo "✅ Vérification des installations..."
pandoc --version
xelatex --version
python --version

echo "🚀 Build terminé avec succès !"