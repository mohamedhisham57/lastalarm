ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install Python + pip
RUN apk add --no-cache python3 py3-pip

# Copy all required files
COPY run.sh /run.sh
COPY main.py /main.py

# Install dependencies
RUN pip3 install paho-mqtt influxdb PyCRC-Hex

# Make your shell script executable
RUN chmod a+x /run.sh

# Start the script
CMD [ "/run.sh" ]
