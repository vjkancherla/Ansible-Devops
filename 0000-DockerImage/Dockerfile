# Use the official Ubuntu 20.04 image as a base image
FROM ubuntu:20.04

# Install SSH server and create the privilege separation directory
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /run/sshd && \
    chmod 755 /run/sshd && \
    apt-get clean


# Install sudo
RUN apt-get install -y sudo && \
    apt-get clean


# Generate SSH host keys if they don't already exist
RUN [ -f /etc/ssh/ssh_host_rsa_key ] || ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    [ -f /etc/ssh/ssh_host_dsa_key ] || ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N '' && \
    [ -f /etc/ssh/ssh_host_ecdsa_key ] || ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
    [ -f /etc/ssh/ssh_host_ed25519_key ] || ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''


# Create an SSH user (replace 'youruser' and 'yourpassword' with your desired username and password)
RUN useradd -m -s /bin/bash testuser && \
    echo 'testuser:testpassword' | chpasswd

# Add 'testuser' to the sudo group and grant passwordless sudo privileges
RUN usermod -aG sudo testuser && \
    echo 'testuser ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/testuser

# Create SSH directory and add the public key for passwordless authentication
RUN mkdir -p /home/testuser/.ssh && \
    chmod 700 /home/testuser/.ssh && \
    touch /home/testuser/.ssh/authorized_keys && \
    chmod 600 /home/testuser/.ssh/authorized_keys && \
    chown -R testuser:testuser /home/testuser/.ssh

# Copy the user's public key (replace 'your-public-key' with the actual public key)
COPY ssh-keys/testuser-public-key.pem /home/testuser/.ssh/authorized_keys

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
