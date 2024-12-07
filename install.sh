#!/bin/bash

# Variables for the URLs of the Python script and logo
SCRIPT_URL="https://github.com/AkhilNagipogu/TIME-linux-based-/raw/main/time_display.py"
LOGO_URL="https://github.com/AkhilNagipogu/TIME-linux-based-/raw/main/time_logo.png"

# Define the paths where the script and logo will be stored
SCRIPT_NAME="time.py"
LOGO_NAME="time_logo.png"
DESKTOP_FILE="$HOME/.local/share/applications/Time.desktop"
ICON_DIR="$HOME/.local/share/icons"
ICON_PATH="$ICON_DIR/$LOGO_NAME"

# Step 1: Install dependencies (Tkinter)
echo "Installing required dependencies..."
sudo apt update
sudo apt install -y python3-tk curl

# Step 2: Download the Python script and logo
echo "Downloading the Python script..."
curl -L $SCRIPT_URL -o $SCRIPT_NAME

echo "Downloading the logo..."
curl -L $LOGO_URL -o $ICON_PATH

# Step 3: Make the Python script executable
chmod +x $SCRIPT_NAME

# Step 4: Create the .desktop file for the application
echo "Creating desktop entry..."

cat > $DESKTOP_FILE <<EOL
[Desktop Entry]
Version=1.0
Name=Time
Comment=Displays current time in a black window
Exec=python3 $HOME/$SCRIPT_NAME
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Utility;
EOL

# Step 5: Make the .desktop file executable
chmod +x $DESKTOP_FILE

# Step 6: Refresh the desktop environment database
update-desktop-database $HOME/.local/share/applications/

# Step 7: Inform the user
echo "Setup complete! You can now launch the 'Time' application from your application menu."
