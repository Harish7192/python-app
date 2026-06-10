# 1. Use the official Python slim runtime as a parent image
FROM python:3.11-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy only the requirements file first to leverage Docker layer caching
COPY requirements.txt .

# 4. Install dependencies without storing local cache to keep the image small
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the application source code into the container
COPY app.py .

# 6. Inform Docker that the container listens on port 8080 at runtime
EXPOSE 8080

# 7. Define the command to execute your Flask application
CMD ["python", "app.py"]
