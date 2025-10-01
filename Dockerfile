# Imagem base minimalista
FROM python:3.11-slim

# Evita problemas de buffering de logs
ENV PYTHONUNBUFFERED=1

# Instala dependências básicas (gcc, g++, etc. — necessárias para scipy)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Cria diretório de trabalho
WORKDIR /app

# Instala apenas as libs necessárias
RUN pip install --no-cache-dir streamlit pandas scipy

# Copia a aplicação para dentro do container
COPY . /app

# Expõe a porta do Streamlit
EXPOSE 8501

# Comando padrão: rodar Streamlit
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
