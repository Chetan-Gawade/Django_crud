# Base image
FROM python:3.12-slim

# Set up working directory
WORKDIR /app

# Copy your project files
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Install PostgreSQL and start it
RUN apt-get update && apt-get install -y postgresql && \
    service postgresql start && \
    su - postgres -c "psql -c \"CREATE USER postgres WITH PASSWORD '123456';\"" && \
    su - postgres -c "psql -c \"CREATE DATABASE payppy OWNER postgres;\""

# Configure PostgreSQL to use `postgres` user with hardcoded settings
RUN echo "listen_addresses='*'" >> /etc/postgresql/14/main/postgresql.conf && \
    echo "host all all 127.0.0.1/32 md5" >> /etc/postgresql/14/main/pg_hba.conf

# Expose PostgreSQL and Django ports
EXPOSE 5432 8000

# Run PostgreSQL in the background and start Django
CMD service postgresql start && python manage.py runserver 0.0.0.0:8000
