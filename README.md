<!-- omit in toc -->
# IT Dictionary

<!-- omit in toc -->
### Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
  - [Windows](#windows)
- [Directory Structure](#directory-structure)

## Overview

This is a customizable dictionary app build with **Flutter**.
It is designed to quickly connect short words in a one-to-one manner, making it especially useful for technical terms.

<br>

- Create and manage your own dictionary
- Rename the dictionary and register entries manually
- Import and export entries as **CSV files**
- Optimized for mapping short words to shoer words
- Default dictionary works as an English-Japanese / Japanese-English IT glossary
  - Type an English word to get the Japanese equivalent
  - Type a Japanese word to get the English equivalent

## Features

## Usage

### Windows

## Directory Structure

```
it_dictionary/
├── .dart_tool/
├── .idea/
├── android/
├── assets/
│   ├── fonts/
│   └── default_words.csv
├── build/
├── ios/
├── lib/
│   ├── models/               # CSV related
│   ├── providers/            # Provider related
│   ├── screens/              # pages
│   ├── services/             # 
│   ├── utils/                # 
│   ├── widgets/              # 
│   ├── app.dart              # 
│   └── main.dart             # 
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── .flutter-plugins-dependencies
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── it_dictionary.iml
├── pubspec.lock
├── pubspec.yaml                 # Dependencies settings
└── README.md                    # This file
```
