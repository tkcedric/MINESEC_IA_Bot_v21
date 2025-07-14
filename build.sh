#!/bin/bash
set -e

# Convertir le notebook en script Python
echo "🔄 Conversion du notebook en script Python..."
jupyter nbconvert --to script minesec_bot.ipynb --output-dir=. --output=minesec_bot

# Installation des dépendances
echo "🐍 Installation des dépendances Python..."
pip install --upgrade pip
pip install -r requirements.txt

# Démarrer le bot
echo "🚀 Démarrage du bot..."
python minesec_bot.py