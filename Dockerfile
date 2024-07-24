# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV SRVPORT=4499
ENV RSPFILE=response
ENV PATH="${PATH}:/usr/games"

# Install necessary packages
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd dos2unix && \
    apt-get clean

# Copy the script into the container

COPY wisecow.sh /usr/local/bin/wisecow.sh

# Convert line endings from CRLF to LF and make the script executable
RUN dos2unix /usr/local/bin/wisecow.sh && chmod +x /usr/local/bin/wisecow.sh

# Expose the port the server will run on
EXPOSE 4499

# Set the entry point to the script
ENTRYPOINT ["/usr/local/bin/wisecow.sh"]
