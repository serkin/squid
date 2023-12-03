SQUID_PORT="${1:-3128}"

sudo apt update
sudo apt install -y docker.io

########### Creating swap

SWAP_SIZE_MB=1024

# Set the swap file path
SWAP_FILE_PATH=/swapfile

# Check if the swap file already exists
if [ -e "$SWAP_FILE_PATH" ]; then
    echo "Swap file $SWAP_FILE_PATH already exists. Exiting."
    exit 1
fi

# Create an empty file of the specified size
sudo dd if=/dev/zero of=$SWAP_FILE_PATH bs=1M count=$SWAP_SIZE_MB

# Set proper permissions
sudo chmod 600 $SWAP_FILE_PATH

# Make it a swap file
sudo mkswap $SWAP_FILE_PATH

# Enable the swap file
sudo swapon $SWAP_FILE_PATH

# Add an entry to /etc/fstab to make the swap file persistent across reboots
echo "$SWAP_FILE_PATH none swap sw 0 0" | sudo tee -a /etc/fstab




SQUID_CONF_FILE=/root/squid.conf

echo "http_port 3128
http_access allow all" > $SQUID_CONF_FILE

SQUID_CACHE_DIR=/srv/docker/squid/cache
sudo mkdir -p $SQUID_CACHE_DIR
sudo chmod 0777 $SQUID_CACHE_DIR


docker run --name squid -d --restart=always \
  --publish $SQUID_PORT:3128 \
  --volume $SQUID_CONF_FILE:/etc/squid/squid.conf \
  --volume $SQUID_CACHE_DIR:/var/spool/squid \
  sameersbn/squid:3.5.27-2
