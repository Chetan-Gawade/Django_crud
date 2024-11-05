FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 8000
EXPOSE 8000

# Run a simple HTTP server
CMD ["python3", "-m", "http.server", "8000"]
