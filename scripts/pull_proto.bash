#!/bin/bash

# Check if a tag was passed as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <tag>"
    echo "Ex: $0 v1.2.3"
    exit 1
fi

# Configuration
REPO_URL="https://github.com/qdrant/qdrant" 
TAG="$1" 
SCRIPT_DIR=$(dirname "$0")
DEST_DIR="$SCRIPT_DIR/../proto/" # 
PROTO_DIR="lib/api/src/grpc/proto/" 
VERSION_FILE="$DEST_DIR/__VERSION__.txt" 

# Temporary directory for cloning
TMP_DIR=$(mktemp -d)

# Function to clone, copy .proto files, and save the version
clone_copy_and_save_version() {
    echo "🚜 Cloning repository from tag $TAG..."
    if git clone -b "$TAG" --single-branch --depth 1 "$REPO_URL" "$TMP_DIR" > /dev/null 2>&1; then
        :
    else
        echo "❌ Clone failed. Please check the tag for existance"
        exit 1
    fi
    

    echo "🧹 Cleaning the destination directory..."
    rm -rf "$DEST_DIR"/*

    echo "🔂 Copying .proto files..."
    mkdir -p "$DEST_DIR"
    cp "$TMP_DIR/$PROTO_DIR"/*.proto "$DEST_DIR"

    echo "🆚 Saving version information..."
    echo "$TAG" > "$VERSION_FILE"

    echo "🧹 Cleaning up..."
    rm -rf "$TMP_DIR"

    echo "✅ Done."
}

# Execute the function
clone_copy_and_save_version
