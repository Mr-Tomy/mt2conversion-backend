# Usa una imagen oficial de Python
FROM python:3.11-slim

# Instala dependencias del sistema (FFmpeg + Tesseract)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    tesseract-ocr \
    libtesseract-dev \
    poppler-utils \
    libgl1 \
    libsm6 \
    && rm -rf /var/lib/apt/lists/*

# Configura el entorno
WORKDIR /app
ENV PYTHONUNBUFFERED=1
ENV PORT=8000

# Instala dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia tu código
COPY . .

# Comando para iniciar la app
CMD ["python", "app.py"]