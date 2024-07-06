# Use the official Python image with the desired version
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy only the pyproject.toml and poetry.lock files to install dependencies first
COPY pyproject.toml poetry.lock* /app/

# Install curl to download Poetry
RUN apt-get update && apt-get install -y curl

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to the PATH
ENV PATH="/root/.local/bin:$PATH"

# Install dependencies using Poetry
RUN poetry install --no-root

# Copy the rest of the application code to the container
COPY . /app

# Ensure prestart script is executable
RUN chmod +x ./prestart.sh

# Expose the port FastAPI will run on
EXPOSE 8000

# Set up the database and run the backend server
CMD ["sh", "-c", "poetry run bash ./prestart.sh && poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000"]