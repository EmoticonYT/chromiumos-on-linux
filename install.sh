#!/bin/bash

echo "Welcome to Chromium OS Installer for Linux by EmoticonYT!"
read -n 1 -s -r -p "Press any key to continue..."
echo -e "\n"

echo "Installing Chromium OS..."

# Using -p to prevent "File exists" errors
mkdir -p /tmp/chromiumosinstallation

cd /tmp/chromiumosinstallation

echo "Downloading Chromium OS binary (this may take a minute)..."
# Using quotes and -o to ensure the file is saved correctly
curl -L "https://download-chromium.appspot.com/dl/Linux_ChromiumOS_Full?type=snapshots" -o chrome-chromiumos.zip

echo "Extracting files..."
# Unzip and move contents from the dynamic folder name created by the zip
unzip chrome-chromiumos.zip > /dev/null 2>&1
INTERNAL_FOLDER=$(find . -maxdepth 1 -type d -not -path '.' | head -n 1)
mv "$INTERNAL_FOLDER"/* . > /dev/null 2>&1

mkdir -p ~/chromiumos-system

mv * ~/chromiumos-system > /dev/null 2>&1

cd ~/chromiumos-system

echo -e '#!/bin/bash\nFILE="/home/$USER/chromiumos-system/chrome"\nif [ -f "$FILE" ]; then\n    $FILE --no-sandbox\nelse\n    echo "Chromium OS System Binary not found, or moved!"\nfi' > start && chmod +x start

# Ensure the symlink is created/updated
ln -sf ~/chromiumos-system/start ~/.local/bin/chromiumos

echo "Chromium OS successfully installed!"
echo "Please choose from the options provided below:"
echo ""

options=("Start Chromium OS" "Finalize Installation and Exit")

select opt in "${options[@]}"
do
    case $opt in
        "Start Chromium OS")
            echo ""
            echo "Thank you for using Chromium OS installer for Linux by EmoticonYT! To start Chromium OS again, type \"chromiumos\" in your terminal. Starting Chromium OS now..."
            ~/chromiumos-system/start
            exit 0
            ;;
            
        "Finalize Installation and Exit")
            echo ""
            echo "Thank you for using Chromium OS installer for Linux by EmoticonYT! To start Chromium OS, type \"chromiumos\" in your terminal."
            exit 0
            ;;
            
        *) 
            echo "Invalid option. Please press 1 or 2."
            ;;
    esac
done
