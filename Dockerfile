# Use the official Python image as the base image
FROM python:3.12-slim

# Set working directory inside container
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Copy the Django project into the container
COPY . /app/

# Expose the port that Django will run on
EXPOSE 8000

# Set the command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

