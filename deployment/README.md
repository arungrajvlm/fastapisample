# Deployment Instructions (Amazon Linux 2)

This guide assumes you have an EC2 instance running Amazon Linux 2 and have SSH access.

## Prerequisites

1.  SSH into your EC2 instance.
    ```bash
    ssh -i your-key.pem ec2-user@your-ec2-ip
    ```

## One-Step Deployment

We have included a script to automate the setup.

1.  Run the following commands on your server to download the setup script (if you haven't cloned the repo yet, you might need to copy the script contents manually or just run these commands one by one):

    Since the script is in the repo, the easiest way is to just clone the repo first manually, or copy-paste the script.

    **Option A: Manual Clone First**
    ```bash
    sudo yum install git -y
    git clone https://github.com/arungrajvlm/fastapisample.git
    cd fastapisample
    bash deployment/setup.sh
    ```

    **Option B: Copy Script**
    Create a file named `setup.sh` on your server, paste the content of `deployment/setup.sh`, and run `bash setup.sh`.

## Maintenance

-   **Restart Server**: `sudo systemctl restart fastapi`
-   **View Logs**: `journalctl -u fastapi -f`
-   **Stop Server**: `sudo systemctl stop fastapi`

## Important Note

-   Ensure your EC2 Security Group allows inbound traffic on port `8000` (or whichever port you configured).
-   For production, it is highly recommended to set up Nginx as a reverse proxy on port 80 and install SSL (Let's Encrypt).
