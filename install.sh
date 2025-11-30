#!/bin/sh

# ------------------------------
# ⚙ Server_EAGLE Plugin Installer (Updated)
# ------------------------------

PLUGIN_NAME="Server_EAGLE"
PLUGIN_VERSION="1.00"

clear
echo ""
echo "┌────────────────────────────────────────────────────┐"
echo "│                  ⚙ AMR TEAM ⚙                     │"
echo "├────────────────────────────────────────────────────┤"
echo "│ This script will install the Server Eagle plugin   │"
echo "│ on your Enigma2-based receiver.                    │"
echo "│                                                    │"
echo "│ Version   : 1.00                                   │"
echo "│ Developer : Ahmed Amr                              │"
echo "└────────────────────────────────────────────────────┘"
echo ""

# === Configuration ===
ZIP_PATH="/tmp/Server_EAGLE.zip"
EXTRACT_DIR="/tmp/ServerEagleSat"
INSTALL_DIR="/usr/lib/enigma2/python/Plugins/Extensions"

PLUGIN_URL="https://raw.githubusercontent.com/ahmedamr17/EAGLE_SERVER/main/Server_EAGLE.zip"

# === Step 1: Download ===
echo "[1/4] 🔽 Downloading plugin package from:"
echo "https://raw.githubusercontent.com/ahmedamr17/EAGLE_SERVER/main/Server_EAGLE.zip"
cd /tmp || { echo "❌ Cannot change directory to /tmp. Aborting."; exit 1; }
wget "$PLUGIN_URL" -O "$ZIP_PATH"
if [ $? -ne 0 ]; then
    echo "❌ Failed to download the plugin. Please check your connection or URL."
    exit 1
fi

# === Step 2: Extract & Install ===
echo "[2/4] 📦 Extracting files and installing..."
unzip -o "$ZIP_PATH" -d "$EXTRACT_DIR" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Extraction failed. The ZIP file may be corrupted."
    exit 1
fi

rm -rf "$INSTALL_DIR/ServerEagleSat"
cp -r "$EXTRACT_DIR/ServerEagleSat" "$INSTALL_DIR"
if [ [ $? -ne 0 ]; then
    echo "❌ Failed to copy plugin to Enigma2 plugins directory."
    exit 1
fi

# === Step 3: Cleanup ===
echo "[3/4] 🧹 Cleaning up..."
rm -rf "$EXTRACT_DIR"
rm -f "$ZIP_PATH"

# === Step 4: Final Message ===
echo "[4/4] ✅ Installation complete!"
echo ""
echo "🎉 The plugin \"Server_EAGLE\" (v1.00) has been installed successfully."

# === Subscription info ===
echo ""
echo "📞 للإشتراك المرجو التواصل معنا عبر الواتس آب أو رقم الهاتف:"
echo "01068512690"
echo ""

exit 0
