    FROM python:3.10-slim
    
    # Set environment variables
    ENV PYTHONDONTWRITEBYTECODE 1
    ENV PYTHONUNBUFFERED 1
    
    # Set the working directory in the container
    WORKDIR /app
    
    # Install Poetry
    RUN pip install poetry
    
    # Copy only the dependency files to optimize caching
    COPY poetry.lock pyproject.toml /app/
    
    # Install dependencies
    RUN poetry config virtualenvs.create false \
        && poetry install --no-dev --no-interaction --no-ansi
    
    # Copy the application code into the container
    COPY . /app/
    
    # Expose the port where FastAPI runs (adjust if necessary)
    EXPOSE 8000

    CMD poetry run bash ./prestart.sh; poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000