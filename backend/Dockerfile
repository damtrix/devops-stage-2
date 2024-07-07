# Use the official Python image with the desired version
FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy only the pyproject.toml and poetry.lock files to install dependencies first
COPY pyproject.toml poetry.lock* /app/

# Install curl to download Poetry
RUN apt-get update && apt-get install -y curl

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Install dependencies using Poetry
RUN poetry install

# Copy the rest of the application code to the container
COPY . /app

# Ensure prestart script is executable
RUN chmod +x ./prestart.sh

# Expose the port FastAPI will run on
EXPOSE 8000

#  # Set environment variables
# ENV DOMAIN="damtrix.mooo.com"

# # Environment: local, staging, production
# ENV ENVIRONMENT=local

# ENV PROJECT_NAME="Full Stack FastAPI Project"
# ENV STACK_NAME=full-stack-fastapi-project
# ENV BACKEND_CORS_ORIGINS="http://localhost,http://localhost:5173,https://localhost,https://localhost:5173,http://damtrix.mooo.com,https://damtrix.mooo.com"
# ENV SECRET_KEY=changethis123
# ENV FIRST_SUPERUSER=devops@hng.tech
# ENV FIRST_SUPERUSER_PASSWORD=devops#HNG11
# ENV USERS_OPEN_REGISTRATION=True

# # Emails
# ENV SMTP_HOST=
# ENV SMTP_USER=
# ENV SMTP_PASSWORD=
# ENV EMAILS_FROM_EMAIL=info@example.com
# ENV SMTP_TLS=True
# ENV SMTP_SSL=False
# ENV SMTP_PORT=587

# # Postgres
# ENV POSTGRES_SERVER=dpg-cq4pcstds78s73co6hcg-a.oregon-postgres.render.com
# ENV POSTGRES_PORT=5432
# ENV POSTGRES_DB=hngstage2
# ENV POSTGRES_USER=hngstage2_user
# ENV POSTGRES_PASSWORD=dUNBb643DeNbnqq8BUFoaW9mIChlNQrV


# Run the application
RUN bash /app/prestart.sh
    
# Command to run the application
CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]