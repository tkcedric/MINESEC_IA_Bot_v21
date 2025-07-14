FROM python:3.9-slim

# 1. Installer les dépendances système
RUN apt-get update && \
    apt-get install -y \
    pandoc \
    texlive-xetex \
    texlive-latex-base \
    texlive-latex-extra \
    fonts-liberation \
    fonts-dejavu && \
    rm -rf /var/lib/apt/lists/*

# 2. Copier les fichiers
WORKDIR /app
COPY . .

# 3. Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# 4. Lancer l'application
CMD ["python", "minesec_bot.ipynb"]