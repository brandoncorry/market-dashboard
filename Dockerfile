# Use a base image with Python installed
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the entire repository into the container
COPY . .

# Install Python dependencies, if any
# Ensure that `requirements.txt` exists in the repository
RUN pip install --no-cache-dir -r requirements.txt || echo "No requirements to install"

# For serving index.html, we'll use Python's http.server
# Expose port 8000 for HTTP traffic
EXPOSE 8000

# Command to first fetch the data
# and then serve the `index.html` file using Python's HTTP server
CMD ["sh", "-c", "python fetch_data.py && python -m http.server 8000 --bind 0.0.0.0"]