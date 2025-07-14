FROM python:3.9-slim

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
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
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# Installer les dépendances Python (y compris nbconvert)
RUN pip install --no-cache-dir -r requirements.txt

CMD ["bash", "build.sh"]