# Project Setup Script

This script automates the setup of a full-stack desktop application using **Flask**, **SQLAlchemy**, **PyWebView**, and **Vue.js**. It creates the necessary project structure, installs dependencies, and configures a basic frontend and backend environment.

## Features

- Creates a Python virtual environment
- Installs necessary Python and JavaScript dependencies
- Sets up Flask for backend development
- Initializes Vue.js for frontend development
- Installs Bootstrap for styling
- Generates required directories and files

## Prerequisites

Make sure you have the following installed on your system:

- **Python 3** (with `venv` module)
- **Node.js & npm**
- **Bash** (for running the script on Linux/Mac)

## Installation

1. Clone the repository (or download the script directly):
   ```bash
   git clone https://github.com/xxxxxxxx.git
   cd your-project
   ```
2. Make the script executable (if needed):
   ```bash
   chmod +x py-setup-project.sh
   ```
3. Run the script:
   ```bash
   ./py-setup-project.sh
   ```

## Usage

- For **Linux/Mac** users, activate the virtual environment:
  ```bash
  source venv/bin/activate
  ```
- For **Windows** users, activate the virtual environment:
  ```powershell
  source venv/Scripts/activate
  ```
- To start the Vue.js development server, navigate to the `frontend` directory and run:
  ```bash
  npm run serve
  ```
- To run the PyWebView application:
  ```bash
  python app.py
  ```

## File Structure

```
my_desktop_app/
│── backend/
│   ├── __init__.py
│   ├── app.py
│   ├── database.py
│   ├── models.py
│── frontend/
│   ├── public/
│   ├── src/
│   │   ├── App.vue
│   │   ├── components/
│   │   │   ├── Component1.vue
│── venv/
│── app.py
│── database.db
│── requirements.txt
│── README.md
│── setup_project.sh
```

## Dependencies

The script installs the following dependencies:

- **Python Packages** (listed in `requirements.txt`):
  - Flask
  - SQLAlchemy
  - PyWebView
- **JavaScript Packages**:
  - Vue.js
  - Bootstrap

## Notes

- If you encounter permission issues while installing global npm packages, try using `sudo` (Linux/Mac) or running PowerShell as an administrator (Windows).
- The script assumes that `npm` and `python3` are available in your system's PATH.

## License

This project is licensed under the MIT License.
