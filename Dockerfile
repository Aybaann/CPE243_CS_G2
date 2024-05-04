FROM python:3.10-slim

# Install Ansible and any dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ansible \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /ansible

# Copy your Ansible playbooks into the container
COPY playbook.yml hosts.yml ./

# Default command to run when the container starts
CMD ["ansible-playbook", "-i", "hosts.yml", "playbook.yml"]
