FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY scripts/ ./scripts/

# Token cache is written here (see TOKEN_CACHE_FILE in the script);
# mount a volume on this path to persist login across container runs.
ENV HOME=/root

ENTRYPOINT ["python", "scripts/ms-todo-sync.py"]
CMD ["--help"]
