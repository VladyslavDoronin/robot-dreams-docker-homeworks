FROM python:3.14-slim

WORKDIR /src

RUN apt-get update && apt-get install -y curl

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ ./src/

EXPOSE 8080

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8080"]

# HEALTHCHECK --interval=10s --timeout=5s --start-period=3s --retries=3 CMD curl -f http://localhost:8080/