Read this in English: [README.md](README.md)

<!-- omit in toc -->
# IT用語辞書

<!-- omit in toc -->
### 目次

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
  - [Windows (Desktop)](#windows-desktop)
  - [Web browser](#web-browser)
- [Directory Structure](#directory-structure)

## 概要

自分でカスタマイズすることのできる辞書アプリです。  
単語同士を一対一の関係でつなげることに特化しています。  
**Flutter**で作成しました。

## 機能

- 自分だけの辞書を作成・管理できる
- 辞書の名前の変更、単語の登録が可能
- 単語を**CSVファイル**でインポート・エクスポートできる
- 短い単語同士の対応付けに最適
- デフォルトはIT用語の和英・英和辞典

## 実行方法

### Windows (デスクトップ)

1. リポジトリをクローン
  ```bash
  git clone https://github.com/kotonekanno/it_dictionary
  cd <path/to/the/directory>
  ```
2. Flutterをインストール：[Flutter公式](https://docs.flutter.dev/get-started)
3. 依存関係を取得
  ```bash
  flutter pub get
  ```
4. 実行
  ```bash
  flutter run -d windows
  ```

### Webブラウザ

1. リポジトリをクローン
  ```bash
  git clone https://github.com/kotonekanno/it_dictionary
  cd <path/to/the/directory>
  ```
2. Flutterをインストール[Flutter公式](https://docs.flutter.dev/get-started)
3. 依存関係を取得
  ```bash
  flutter pub get
  ```
4. 実行
  ```bash
  flutter run -d chrome
  ```

## ディレクトリ構成

```
it_dictionary/
├── android/                        # Androidプラットフォーム用ファイル
├── ios/                            # iOSプラットフォーム用ファイル
├── linux/                          # Linuxプラットフォーム用ファイル
├── macos/                          # macOSプラットフォーム用ファイル
├── windows/                        # Windowsプラットフォーム用ファイル
├── web/                            # Webプラットフォーム用ファイル
├── assets/                         # 静的アセット
│   ├── fonts/                     # カスタムフォント
│   └── default_words.csv          # デフォルトのCSVデータ
├── lib/                            # メインのソースコード
│   ├── models/                    # CSV関連モデル
│   ├── providers/                 # Providerによる状態管理
│   ├── screens/                   # ページ／画面
│   ├── services/                  # サービス／ビジネスロジック
│   ├── utils/                     # ユーティリティ関数
│   ├── widgets/                   # 再利用可能なUIコンポーネント
│   ├── app.dart                   # アプリのルートウィジェット
│   └── main.dart                  # エントリーポイント
├── test/                           # ウィジェットテスト
├── .dart_tool/                     # Flutter & Dartツールの自動生成ファイル
├── .idea/                          # IDEプロジェクト設定
├── .flutter-plugins-dependencies 
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── it_dictionary.iml
├── pubspec.yaml                    # 依存関係とプロジェクト設定
├── pubspec.lock
└── README.ja.md                    # このファイル
```
