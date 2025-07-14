#!/bin/bash
# 1. Install Python kernel properly
python -m pip install ipykernel
python -m ipykernel install --name python3 --user

# 2. Install system dependencies
apt-get update
apt-get install -y \
    pandoc \
    texlive-xetex \
    texlive-latex-base \
    texlive-latex-extra \
    fonts-liberation \
    fonts-dejavu

# 3. Install Python packages
pip install -r requirements.txt

# 4. Fix kernel permission
chmod -R 777 /usr/local/share/jupyter