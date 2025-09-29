日本語で読む：[README.ja.md](README.ja.md)

<!-- omit in toc -->
# IT Dictionary

<!-- omit in toc -->
### Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
  - [Windows (Desktop)](#windows-desktop)
  - [Web browser](#web-browser)
- [Directory Structure](#directory-structure)

## Overview

This is a customizable dictionary app build with **Flutter**.  
It is designed to quickly connect short words in a one-to-one manner, making it especially useful for technical terms.

## Features

- Create and manage your own dictionary
- Rename the dictionary and register entries manually
- Import and export entries as **CSV files**
- Optimized for mapping short words to shoer words
- Quickly find linked words with a simple search
- Default dictionary works as an English-Japanese / Japanese-English IT glossary

## Usage

### Windows (Desktop)

1. Clone this repository
  ```bash
  git clone https://github.com/kotonekanno/it_dictionary
  ```
  ```bash
  cd <path/to/the/directory>
  ```
2. Install Flutter: [Flutter Official](https://docs.flutter.dev/get-started)
3. Get dependencies
  ```bash
  flutter pub get
  ```
4. Run the app
  ```bash
  flutter run -d windows
  ```

### Web browser

1. Clone this repository
  ```bash
  git clone https://github.com/kotonekanno/it_dictionary
  ```
  ```bash
  cd <path/to/the/directory>
  ```
2. Install Flutter: [Flutter Official](https://docs.flutter.dev/get-started)
3. Get dependencies
  ```bash
  flutter pub get
  ```
4. Run the app
  ```bash
  flutter run -d chrome
  ```

## Directory Structure

```
it_dictionary/
├── android/                        # Android platform-specific files
├── ios/                            # iOS platform-specific files
├── linux/                          # Linux platform-specific files
├── macos/                          # macOS platform-specific files
├── windows/                        # Windows platform-specific files
├── web/                            # Web platform-specific files
├── assets/                         # Static assets
│   ├── fonts/                     # Custom fonts
│   └── default_words.csv          # Default CSV data
├── lib/                            # Mainsource code
│   ├── models/                    # CSV related models
│   ├── providers/                 # State management with Provider
│   ├── screens/                   # Pages/Screens
│   ├── services/                  # Services/business logic
│   ├── utils/                     # Utility functions
│   ├── widgets/                   # Reusable UI components
│   ├── app.dart                   # App root widget
│   └── main.dart                  # Entry point
├── test/                           # Widget tests
├── .dart_tool/                     # Flutter & Dart tool files (auto-generated)
├── .idea/                          # IDE project settings
├── .flutter-plugins-dependencies 
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── it_dictionary.iml
├── pubspec.yaml                    # Dependencies and project settings
├── pubspec.lock
└── README.md                       # This file
```
