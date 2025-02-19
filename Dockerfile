FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir setuptools wheel

COPY . .

RUN python setup.py install

ENV FLASK_APP=hello

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]

