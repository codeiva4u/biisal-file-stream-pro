# Use Python 3.8 as the base image
FROM python:3.8-slim

# Install system dependencies for packages
RUN apt-get update && apt-get install -y build-essential libssl-dev

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port if required
EXPOSE 8080

# Command to run the application
CMD ["python3", "-m", "biisal"]
