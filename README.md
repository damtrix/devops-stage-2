# Full-Stack FastAPI and React Template

Welcome to the Full-Stack FastAPI and React template repository. This repository serves as a demo application for interns, showcasing how to set up and run a full-stack application with a FastAPI backend and a ReactJS frontend using ChakraUI.

## Project Structure

The repository is organized into two main directories:

- **frontend**: Contains the ReactJS application.
- **backend**: Contains the FastAPI application and PostgreSQL database integration.

Each directory has its own README file with detailed instructions specific to that part of the application.

## Getting Started

To get started with this template, please follow the instructions in the respective directories:

- [Frontend README](./frontend/README.md)
- [Backend README](./backend/README.md)

- # A Dockerized Full Stack Web Application Deployment

## Project Overview

This repository contains Docker configuration files and setup instructions for deploying a full stack web application consisting of a React frontend, FastAPI backend with PostgreSQL database.

## Prerequisites

Ensure you have installed the following tools and dependencies:

- Docker
- Docker Compose
- Git

## Setup Instructions

### Local Development

1. **Clone the Repository:**
   git clone <forked-repository-url>
   cd <repository-directory>

2. **Build and Run the Services:**
   docker compose up -d --build

3. **Access the Application:**

- Frontend: http://localhost/
- Backend API: http://localhost/api/
- Adminer (Database UI): http://localhost:8080/

### Deployment on AWS

To deploy the application on AWS and set up HTTPS, follow these steps:

1. **Prepare Docker Compose File:**
   Modify `docker-compose.yml` as necessary for production environment settings.

2. **Set Up an EC2 Instance:**

- Provision an instance (virtual machine) on AWS with Docker installed, open the necessary ports like 5173, 80, 8090, 8000, 3000, 81.
- Configure SSH access using SSH keys.

3. **Deploy Application to AWS EC2:**

- SSH into your Instance:
  ```
  using the access keys you can use putty or mobaxterm
- Update your instance
   ```
  sudo apt update
  ``` 
- Clone your repository in the instance:
  ```
  git clone <repository-url>
  cd <repository-directory>
  ```
- Build and run the Docker containers:
  ```
  docker compose up -d --build

4. **Set Up Domain and HTTPS:**

- Obtain a domain name from a registrar like AfraidDNS.
- Configure DNS records to point to your Instance IP address.

## Nginx Configuration

Modify Nginx configuration to handle routing for frontend and backend services, ensuring:

- Frontend serves on root (http://domain/)
- Backend APIs proxy to `/api` (http://domain/api/)
- Adminer accessible via subdomain (http://db.domain/)
