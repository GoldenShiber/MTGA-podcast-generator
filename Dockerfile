FROM ubuntu:latest 

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

# Create venv and install packages there
RUN python3 -m venv /opt/venv \
 && /opt/venv/bin/python -m pip install --upgrade pip \
 && /opt/venv/bin/python -m pip install PyYAML

# Make sure your script uses the venv Python
COPY feed.py /usr/bin/feed.py
ENV PATH="/opt/venv/bin:${PATH}"

COPY entrypoint.sh /entrypoint.sh

#File that runs when finished procering 
ENTRYPOINT ["/entrypoint.sh"]
