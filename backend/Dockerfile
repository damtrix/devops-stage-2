# Dockerfile for FastAPI Backend
FROM python:3.9-slim

# Install Poetry
RUN pip install poetry

# Set working directory
WORKDIR /app

# Copy only the poetry files to leverage caching
COPY pyproject.toml poetry.lock* ./

# Install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Copy the rest of the application
COPY . .

# Command to run the application
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

EXPOSE 8000