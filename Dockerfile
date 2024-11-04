# Use Python 3.8 as the base image
FROM python:3.8-slim

# Install system dependencies for packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements file first for better caching
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . /app

# Expose port
EXPOSE 8080

# Run the application
CMD ["python", "-m", "biisal"]
