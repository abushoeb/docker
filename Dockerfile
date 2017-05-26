# Use an official Python runtime as a base image
FROM python:2.7-slim

# Set the working directory to /app/docker
WORKDIR /app/docker

# Copy the current directory contents into the container at /app/docker
ADD . /app/docker

# Install any needed packages specified in requirements.txt
# RUN pip install -r requirements.txt
RUN pip --proxy http://proxy.lbs.alcatel-lucent.com:8000 install -r requirements.txt # with proxy

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
