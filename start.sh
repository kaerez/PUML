#!/bin/bash

# 1. Signal Nginx that we are ready
touch /tmp/app-initialized

# 2. Print the directory to debug file missing errors
echo "Current directory content:"
ls -al

# 3. Start Java with memory limits (Prevents 137 Errors)
# We use 384m to leave room for Nginx within the 512m Dyno limit
java -Xmx384m -jar plantuml-1.2025.10.jar -picoweb:8080
