# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install application dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the application will run on
EXPOSE 5000

# Set the entry point command to run the application
CMD ["python", "app.py"]
