# Imagem base oficial do Python
FROM python:3.10-slim

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos para dentro do container
COPY requirements.txt .
COPY app.py .

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta padrão do Streamlit
EXPOSE 8501

# Comando para rodar a aplicação
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
