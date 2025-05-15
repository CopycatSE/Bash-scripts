#!/bin/bash

# Define the directory where this script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Project directory name
PROJECT_NAME="my_desktop_app"

# Path to the project directory to be created
PROJECT_PATH="$SCRIPT_DIR/$PROJECT_NAME"

# Create the project's root directory
mkdir -p $PROJECT_PATH

# Initialize git repository and add .gitignore
cd $PROJECT_PATH
git init

# Add .gitignore for Python, Node, and OS junk files
echo 'venv/
__pycache__/
database.db
*.pyc
*.pyo
.DS_Store
node_modules/
dist/
build/
.env
frontend/node_modules/
frontend/dist/
frontend/.env
' > .gitignore

 # Change directory to the project directory
# (already in $PROJECT_PATH after git init above)

# Create a Python virtual environment
python3 -m venv venv

# Activate the virtual environment (for Linux/Mac)
source venv/bin/activate

# For Windows (uncomment if you're using Windows)
# source venv/Scripts/activate

# Install Flask, SQLAlchemy, and pywebview in the virtual environment
pip install --upgrade pip
pip install Flask SQLAlchemy pywebview

 # Create backend directories
mkdir -p backend/static

# Add __init__.py to all backend subfolders
touch backend/__init__.py
touch backend/static/__init__.py

# Create backend files
touch backend/app.py
touch backend/database.py
touch backend/models.py

# Create an empty SQLite database file
touch database.db

# Create frontend directories
mkdir -p frontend/public
mkdir -p frontend/src/assets
mkdir -p frontend/src/components

# Change directory to the frontend directory
cd frontend

# Initialize npm and create package.json
npm init -y

# Update npm to the latest version
npm install -g npm@latest

# Install Vue CLI locally
npm install @vue/cli@latest --save-dev

# Initialize a Vue.js project using Vue 3
npx vue create . --default --packageManager npm --inlinePreset '{ "useConfigFiles": true, "plugins": { "vue-cli-plugin-babel": {}, "vue-cli-plugin-eslint": {} }, "vueVersion": "3" }'

# Install the latest version of Bootstrap with Vue 3 support
npm install bootstrap@latest

# Update configuration files
touch src/App.vue
touch src/components/Component1.vue

# Return to the project's root directory
cd $PROJECT_PATH

# Create the main file for PyWebView
touch app.py

# Create the Python dependencies file
touch requirements.txt

# Create README.md
touch README.md

# Notification of completion
echo "Project structure $PROJECT_NAME created in directory $PROJECT_PATH."

# Add template files (optional, feel free to remove or add more)
echo '<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>' > frontend/src/App.vue

echo '<template>
  <div class="container">
    <h1 class="text-center">My Bootstrap Component</h1>
    <button class="btn btn-primary" @click="fetchData">Fetch Data</button>
    <ul class="list-group mt-3">
      <li class="list-group-item" v-for="item in data" :key="item.id">{{ item.data }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: []
    }
  },
  methods: {
    fetchData() {
      fetch("/api/data")
        .then(response => response.json())
        .then(data => {
          this.data = data;
        });
    }
  }
};
</script>' > frontend/src/components/Component1.vue

# Add Python dependencies to requirements.txt
echo 'Flask==3.0.3
SQLAlchemy==2.0.36
pywebview==5.3' > requirements.txt

# Main file to run PyWebView
echo 'import webview
from backend.app import create_app

app = create_app()

if __name__ == "__main__":
    webview.create_window("My Desktop App", app, width=800, height=600)
    webview.start()' > app.py

# Notification of file creation completion
echo "Template files added to directory $PROJECT_PATH."

# Instructions for activating the virtual environment
echo "To activate the virtual environment on Linux/Mac, run 'source venv/bin/activate'."
echo "For Windows, run 'source venv/Scripts/activate'."

# Message on completion of dependencies installation
echo "Vue.js, Bootstrap, Flask, SQLAlchemy, and pywebview have been successfully installed."