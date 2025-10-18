Read this in English: [README.md](README.md)

<!-- omit in toc -->
# IT用語辞書

<!-- omit in toc -->
### 目次

- [概要](#概要)
- [機能](#機能)
- [実行方法](#実行方法)
  - [Windows (デスクトップ)](#windows-デスクトップ)
  - [Webブラウザ](#webブラウザ)
  - [Node.js server](#nodejs-server)
- [ディレクトリ構成](#ディレクトリ構成)

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
```

2. Flutterをインストール：[Flutter公式](https://docs.flutter.dev/get-started)

3. `it_dictionary/flutter_app`に移動
```bash
cd <path/to/the/directory>
```

4. 依存関係を取得
```bash
flutter pub get
```

5. 実行
```bash
flutter run -d windows
```

### Webブラウザ

1. リポジトリをクローン
```bash
git clone https://github.com/kotonekanno/it_dictionary
```

2. Flutterをインストール：[Flutter公式](https://docs.flutter.dev/get-started)

3. `it_dictionary/flutter_app`に移動
```bash
cd <path/to/the/directory>
```

4. 依存関係を取得
```bash
flutter pub get
```

5. 実行
```bash
flutter run -d chrome
```

### Node.js server

オンライン機能を使うには、以下の手順でNode.jsサーバーを実行してください

1. `it_dictionary/js_server`に移動
```bash
cd path/to/it_dictionary/js_server
```

2. 依存関係をインストール
```bash
npm install bcrypt body-parser cors express jsonwebtoken mysql2
```


3. 実行
``` bash
node server.js
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
│   ├── fonts/                      # カスタムフォント
│   └── default_words.csv           # デフォルトのCSVデータ
├── lib/                            # メインのソースコード
│   ├── models/                     # CSV関連モデル
│   ├── providers/                  # Providerによる状態管理
│   ├── screens/                    # ページ／画面
│   ├── services/                   # サービス／ビジネスロジック
│   ├── utils/                      # ユーティリティ関数
│   ├── widgets/                    # 再利用可能なUIコンポーネント
│   ├── app.dart                    # アプリのルートウィジェット
│   └── main.dart                   # エントリーポイント
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

js_server/
├── node_modules/                   # インストール済みのNode.jsモジュール
├── package-lock.json
├── package.json                    # メタデータとスクリプト
└── server.js                       # Expressサーバー
```
