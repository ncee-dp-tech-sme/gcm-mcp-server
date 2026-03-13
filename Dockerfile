FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src/ src/
COPY .env .env
COPY run.py .
EXPOSE 8002
CMD ["python", "-m", "src", "--transport", "sse", "--port", "8002"]
