    FROM python:3.10-slim
    
    # Set environment variables
    ENV PYTHONDONTWRITEBYTECODE 1
    ENV PYTHONUNBUFFERED 1
    
    # Set the working directory in the container
    WORKDIR /app
    
    # Install system dependencies (if needed)
    RUN apt-get update && apt-get install -y \
        curl \
        build-essential \
        && apt-get clean
    
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

    # Run the application
    RUN bash ./prestart.sh
    
    # Command to run the application
    CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]