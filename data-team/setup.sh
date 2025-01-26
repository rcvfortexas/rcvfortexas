
#!/bin/bash

_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR=$(readlink -f "$_SCRIPT_DIR/..")

PYTHON_VERSION=python3.12 
VENV_DIR="$ROOT_DIR/.venv"

if ! (command -v $PYTHON_VERSION >/dev/null 2>&1); then
    echo -e "${RED}[ERROR] $PYTHON_VERSION not installed run host setup first${RESET}"
fi

if ! [ -d $VENV_DIR ]; then 
    echo -e "${BLUE}[INFO] No venv dir found, creating now...${RESET}"
    python3.12 -m venv $VENV_DIR --prompt "rcv-data"
    echo "PYTHONPATH=$ROOT_DIR" >> $ROOT_DIR/.venv/bin/activate
fi

source $ROOT_DIR/.venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo -e "${GREEN}[SUCCESS] python env created successfully to activate run:
        source .venv/bin/activate ${RESET}"


