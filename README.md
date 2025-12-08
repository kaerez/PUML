<!-- 
============================================
// README.md
============================================
Author: Erez Kalman - KSEC
This project is licensed under a custom Personal Non-Commercial Use License:
Free for personal, private, non-commercial use only.
Code can be reused under these same terms, provided that:
The software remains open source and freely available.
Commercial ownership and rights are retained exclusively by the author (Erez Kalman - KSEC).
Any commercial use, redistribution for profit, or inclusion in proprietary commercial software is strictly prohibited without prior written consent from the author.
-->

# PUML - Local Forge

**PUML - Local Forge** is a robust, single-file, offline-capable PlantUML editor and previewer. It is designed to run locally in any modern web browser without the need for installation, build steps, or external JavaScript dependencies.

## 🚀 Key Features

### 🛠️ Core Functionality
* **Single-File SPA:** The entire application resides in one `puml.html` file. Zero dependencies, zero tracking.
* **Offline Logic:** All encoding (Deflate) and decoding (Inflate) logic is embedded directly in the file.
* **Real-time Preview:** Instant rendering of PlantUML diagrams as you type.
* **Format Support:** View and export diagrams in **PNG**, **SVG**, and **ASCII** formats.

### 💾 Storage & Persistence
* **IndexedDB Integration:** Diagrams are stored securely in your browser's local database (`puml_db`).
* **Library Management:** Save, Load, Rename, and Delete diagrams with a full-featured UI.
* **Import/Export:** * Backup your entire diagram library to JSON.
    * Export specific diagrams as `.puml` source files.
    * Download rendered images.

### ⚙️ Service Configuration
* **Multi-Service Support:** Toggle between the official PlantUML server, a local server (e.g., Docker container on port 8080), or custom enterprise URLs.
* **Secure Authentication:** Support for **Bearer Tokens** for protected internal PlantUML servers. Tokens are stored locally and sent via headers (preventing leakage in URLs).
* **Privacy Focused:** Requests are made with `credentials: 'omit'` to prevent cookie leakage.

### 🔧 Advanced Tools
* **Robust Decoding:** Includes a custom, compact JavaScript Inflate engine capable of decoding complex, legacy, or slightly malformed PlantUML strings that native browser APIs might reject.
* **Zoom & Scale:** Native zooming controls for inspecting large diagrams.
* **Editor Tools:** Copy source, download source, and upload files directly to the editor.

## 📦 Getting Started

1.  **Download:** Save the `puml.html` file to your computer.
2.  **Run:** Double-click the file to open it in your web browser (Chrome, Firefox, Edge, Safari).
3.  **Use:** Start typing PlantUML syntax in the left pane.

### Running a Local PlantUML Server (Recommended)
To generate diagrams completely offline (without hitting `plantuml.com`), you can run the official PlantUML server locally using Java.

1.  **Install Java:** We recommend **[Azul Zulu Builds of OpenJDK](https://www.azul.com/downloads/)** (Standard, LTS versions like Java 17 or 21).
2.  **Download PlantUML:** Get the latest `plantuml-xxxx.jar` from the **[GitHub Releases](https://github.com/plantuml/plantuml/releases)**.
3.  **Run:** Open your terminal/command prompt and run the following command (ensure you are in the directory where you downloaded the jar):
    ```bash
    java -jar plantuml.jar -picoweb
    ```
    *(Note: Replace `plantuml.jar` with the actual filename version you downloaded).*
    
    * **Custom Port:** By default, it runs on port `8080`. To change it, use:
        ```bash
        java -jar plantuml.jar -picoweb:8081
        ```
4.  **Configure:** In PUML Local Forge, select **Local (Port 8080)** via the Gear icon settings.

### 🐳 Running with Docker
Alternatively, you can run the official server image via Docker:

```bash
docker run -d -p 8080:8080 plantuml/plantuml-server:jetty
```

### ☁️ Deploying to Heroku
This repository is configured for deployment to Heroku to create your own private PlantUML rendering server.

* **Deployment Scope:** This repo acts as the source code for the backend server when deployed.
* **Exclusions:** The client-side tools (`README.md`, `index.html`, and `puml.html`) are **not used** for the Heroku server deployment and are intended for local usage only.
* **How to Deploy:** Simply push this repository to a Heroku app. It will detect the Java configuration and spin up a Jetty-based PlantUML server.

## 🔒 License

**Author:** Erez Kalman - KSEC

This project is licensed under a custom **Personal Non-Commercial Use License**:

* **Free for personal, private, non-commercial use only.**
* Code can be reused under these same terms, provided that:
    * The software remains open source and freely available.
* **Commercial ownership and rights are retained exclusively by the author (Erez Kalman - KSEC).**
* Any commercial use, redistribution for profit, or inclusion in proprietary commercial software is strictly prohibited without prior written consent from the author.
