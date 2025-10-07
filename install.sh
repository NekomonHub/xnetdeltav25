#!/bin/bash
clear
if [ -z "$PREFIX" ] || [ ! -x "$(command -v pkg)" ]; then
    echo "❌ This script is for Termux only!"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "📦 Installing Node.js..."
    pkg install -y nodejs
else
    echo "✅ Node.js already installed"
fi

if ! command -v jp2a &> /dev/null; then
    echo "📸 Installing jp2a..."
    pkg install -y jp2a
else
    echo "✅ jp2a already installed"
fi

if [ -f package.json ]; then
    echo "📦 Installing npm dependencies..."
    npm install
fi

if [ -f start.sh ]; then
    echo "🚀 Starting project..."
    bash start.sh
else
    echo "ℹ️ start.sh not found, skipping..."
fi

if [ -f adel.js ]; then
    node adel.js
else
    echo "thank you for your contribution"
fi

echo "🎉 Done! Everything installed."
