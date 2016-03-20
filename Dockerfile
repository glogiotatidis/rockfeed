FROM debian:jessie

EXPOSE 5000
WORKDIR /app
CMD ["honcho", "start"]

ADD nginx.conf /
RUN apt-get update && \
    apt-get install -y nginx-light python-pip python-dev libxml2-dev libxslt1-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY . /app
