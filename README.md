# 🚀 Django Project Auto-Setup Script

![Python Version](https://img.shields.io/badge/python-3.7%2B-blue)
![Django Version](https://img.shields.io/badge/django-3.2%2B-green)
![Shell Script](https://img.shields.io/badge/shell_script-bash-purple)
![Platform](https://img.shields.io/badge/platform-windows%20%7C%20linux%20%7C%20macos-lightgrey)

A one-command solution to Django project with virtual environment, perfect for quick project initialization.

## ✨ Features

- ✅ Automatic virtual environment creation
- 📦 Django installation with latest pip
- 📝 Auto-generated requirements.txt
- 🏗️ Ready-to-use project structure
- 🖥️ Cross-platform support (Windows/Git Bash, Linux, macOS)

## 🛠️ Installation & Usage

### Quick Start (One-Line Install)

bash <(curl -sL https://github.com/sbabty/django_project/blob/main/ScriptDjangoProject.sh)

### Manual Installation
  1. Download the script :
    <br>curl -O https://github.com/sbabty/django_project/blob/main/ScriptDjangoProject.sh

  2. Make executable :
    <br>chmod +x ScriptDjangoProject.sh

  3. Run the script :
    <br>./ScriptDjangoProject.sh


## 🏗️ Generated Project Structure
myEnv/<br>
├── Include/         # Python C headers (can be ignored)<br>
├── Lib/             # Installed packages<br>
├── Scripts/         # Virtualenv binaries<br>
│ ├── activate       # Environment activation script<br>
│ ├── activate.bat   # Windows activation<br>
│ └── python.exe     # Python executable<br>
├── myproject/       # Your Django project<br>
│ ├── manage.py      # Django management script<br>
│ └── myproject/     # Project config<br>
│ ├── init.py<br>
│ ├── settings.py    # Django settings<br>
│ ├── urls.py        # URL routing<br>
│ └── wsgi.py        # WSGI configuration<br>
├── pyvenv.cfg       # Virtualenv configuration<br>
├── requirements.txt # Installed dependencies<br>
└── .gitignore       # Basic exclusion file<br>

## 🚀 Quick Commands After Setup

  1. Activate environment (choose your OS):
     <br>source project_env/bin/activate         # Linux/macOS
     <br>project_env\Scripts\activate            # Windows CMD
     <br>source project_env/Scripts/activate     # Git Bash

  2. Navigate to project :
     <br>cd project_env/myproject

  3. Run development server :
     <br>python manage.py runserver

## 🛠️ Troubleshooting
Virtualenv not working on Windows?

Ensure Python is installed from python.org (not Microsoft Store)<br>
Ensure Python is in your PATH<br>
Run as Administrator if encountering permission issues

## 📋 Requirements
Python 3.7+
Git Bash (recommended for Windows)
curl or wget
