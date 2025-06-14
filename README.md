# 🚀 Django Project Auto-Setup Script

![Python Version](https://img.shields.io/badge/python-3.7%2B-blue)
![Django Version](https://img.shields.io/badge/django-3.2%2B-green)
![Shell Script](https://img.shields.io/badge/shell_script-bash-purple)
![Platform](https://img.shields.io/badge/platform-windows%20%7C%20linux%20%7C%20macos-lightgrey)

A one-command solution to bootstrap a Django project with virtual environment, perfect for quick project initialization.

## ✨ Features

- ✅ Automatic virtual environment creation
- 📦 Django installation with latest pip
- 📝 Auto-generated requirements.txt
- 🏗️ Ready-to-use project structure
- 🖥️ Cross-platform support (Windows/Git Bash, Linux, macOS)

## 🛠️ Installation

```bash
# Download the script
curl -O https://raw.githubusercontent.com/yourusername/yourrepo/main/setup_django_project.sh

# Make executable
chmod +x setup_django_project.sh


🚦 Quick Start
./setup_django_project.sh

Project Structure

myEnv/
├── Include/               # Python C headers (can be ignored)
├── Lib/                   # Installed packages
├── Scripts/               # Virtualenv binaries
├── myproject/             # Your Django project
│   ├── manage.py	    # Django management script
│   └── myproject/         # Project config (settings/urls/wsgi)
├── pyvenv.cfg              # Virtualenv configuration
├── requirements.txt        # Installed dependencies
└── .gitignore             # Basic exclusion file


Usage Instructions
After setup:

# Activate environment
source envtest0001/Scripts/activate  # Windows/Git Bash
source envtest0001/bin/activate      # Linux/macOS

# Enter project
cd envtest0001/project11

# Start dev server
python manage.py runserver


Customization
Edit these variables in the script:

VENV_NAME="envtest0001"        # Change virtualenv name
PROJECT_NAME="project11"       # Change project name
REQUIREMENTS_FILE="requirements.txt"  # Change dependencies file


Requirements

Python 3.7+
Git Bash (on Windows)
