set -e

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential libbz2-dev libssl-dev libreadline-dev libffi-dev zsh \
    libgirepository1.0-dev zlib1g-dev libsqlite3-dev wget git liblzma-dev \
    curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libcairo2-dev
