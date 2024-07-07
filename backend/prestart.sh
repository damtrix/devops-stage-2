#! /usr/bin/env bash

# Set the PYTHONPATH to the app directory
export PYTHONPATH=/app

# Let the DB start
python ./app/app/backend_pre_start.py

# Run migrations
alembic upgrade head

# Create initial data in DB
python ./app/app/initial_data.py
