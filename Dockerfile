FROM nikolaik/python-nodejs:python3.10-nodejs20-bullseye

# Install ffmpeg safely
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# App directory
WORKDIR /app

# Copy files
COPY . .

# Install Python deps
RUN pip3 install --no-cache-dir -U pip \
    && pip3 install --no-cache-dir -r requirements.txt

# Start app
CMD ["bash", "start"]
