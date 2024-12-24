set -e

rm -rf ~/.pyenv
curl https://pyenv.run | bash
pyenv install 3.9.21
pyenv install 3.13.1
pyenv global 3.13.1
