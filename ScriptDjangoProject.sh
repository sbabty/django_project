#!/bin/bash

# Enhanced Django Setup Script with Robust Installation Checks

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Interactive Configuration
prompt_with_default() {
    local prompt="$1"
    local default="$2"
    read -p "$(echo -e "${CYAN}$prompt (default: $default): ${NC}")" input
    echo "${input:-$default}"
}

VENV_NAME=$(prompt_with_default "Enter virtual environment name" "Envtest1")
PROJECT_NAME=$(prompt_with_default "Enter Django project name" "Project1")

# System Checks
check_python() {
    if command -v python &> /dev/null && ! python -c "import sys; print(sys.executable)" | grep -q "WindowsApps"; then
        PYTHON_CMD="python"
    elif command -v python3 &> /dev/null; then
        PYTHON_CMD="python3"
    else
        echo -e "${RED}Python not found. Please install from python.org (not Microsoft Store)${NC}"
        echo -e "${YELLOW}Remember to check 'Add Python to PATH' during installation${NC}"
        exit 1
    fi
}

# Main Execution
echo -e "${GREEN}=== Creating Django Project ==="
echo -e "Virtualenv: ${YELLOW}$VENV_NAME${NC}"
echo -e "Project: ${YELLOW}$PROJECT_NAME${NC}"

check_python
echo -e "${CYAN}Using Python: $($PYTHON_CMD --version 2>&1)${NC}"

# Virtualenv Setup
echo -e "${CYAN}Creating virtual environment...${NC}"
$PYTHON_CMD -m venv "$VENV_NAME" || {
    echo -e "${RED}Failed to create virtual environment${NC}"
    exit 1
}

# Activation (Windows/Linux compatible)
echo -e "${CYAN}Activating environment...${NC}"
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    ACTIVATE_SCRIPT="$VENV_NAME/Scripts/activate"
else
    ACTIVATE_SCRIPT="$VENV_NAME/bin/activate"
fi

source "$ACTIVATE_SCRIPT" || {
    echo -e "${RED}Failed to activate virtual environment${NC}"
    exit 1
}

# --- CRITICAL UPGRADES START ---
echo -e "${CYAN}Forcing clean pip upgrade...${NC}"
python -m pip install --upgrade pip --disable-pip-version-check --no-input || {
    echo -e "${RED}Pip upgrade failed${NC}"
    exit 1
}

echo -e "${CYAN}Installing Django (no cache)...${NC}"
pip install django --no-cache-dir --force-reinstall || {
    echo -e "${RED}Django installation failed${NC}"
    exit 1
}
# --- CRITICAL UPGRADES END ---

# Project Setup
echo -e "${CYAN}Creating project structure...${NC}"
cd "$VENV_NAME" || exit
django-admin startproject "$PROJECT_NAME"
python -m pip freeze > requirements.txt
touch pyvenv.cfg CACHEDIR.TAG .gitignore

# Verification
echo -e "\n${GREEN}=== Verification ==="
echo -e "Pip version: ${YELLOW}$(pip --version | cut -d' ' -f2)${NC}"
echo -e "Django version: ${YELLOW}$(python -m django --version)${NC}"

# Structure Display
echo -e "\n${GREEN}=== Project Structure ==="
echo -e "${YELLOW}$VENV_NAME/"
echo -e "├── Include/"
echo -e "├── Lib/"
echo -e "├── Scripts/"
echo -e "├── $PROJECT_NAME/"
echo -e "│   ├── manage.py"
echo -e "│   └── $PROJECT_NAME/"
echo -e "├── pyvenv.cfg"
echo -e "├── CACHEDIR.TAG"
echo -e "└── requirements.txt${NC}"

# Usage Instructions
echo -e "\n${GREEN}To use your project:${NC}"
echo -e "${YELLOW}  source $ACTIVATE_SCRIPT"
echo -e "  cd $VENV_NAME/$PROJECT_NAME"
echo -e "  python manage.py runserver${NC}"

echo -e "\n${GREEN}✔ Setup completed successfully${NC}"