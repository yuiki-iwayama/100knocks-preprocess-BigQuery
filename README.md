# Name
データサイエンス100本ノック（構造化データ加工編）for BigQuery

# Overview
- データサイエンス100本ノック（構造化データ加工編）をBigQueryでやりたい人向けの環境構築（Macでしか検証していません）
- 演習問題とデータのみ[データサイエンス100本ノック（構造化データ加工編）](https://github.com/The-Japan-DataScientist-Society/100knocks-preprocess)から引用
- BigQueryの利用にかかる料金については，自己責任でお願いします

# 動作環境（確認済）
- macOS Monterey 12.3.1
- Docker Desktop 4.6.1 (for Mac)

# 事前準備
## GCPアカウント登録
[【画像で説明】Google Cloud Platform (GCP)の無料トライアルでアカウント登録](https://qiita.com/komiya_____/items/14bd06d0866f182ae912)をご参照ください

## サービスアカウントキーの作成
[データサイエンス100本ノック（構造化データ加工編）をBigQueryでやりたいに応える](https://zenn.dev/ds_rd/articles/100knocks_preprocess_bigquery)のサービスアカウントキーの作成をご参照ください

# Install
- buildする前に.envに必要事項を記載してください
```
$ git clone git@github.com:yuiki-iwayama
$ cd JupyterLab-Docker
$ docker-compose up -d --build
```

# Usage
- ブラウザで以下のURLにアクセスします\n
http://localhost:8888

# Document
- work配下に設問notebookを配置
- work/data配下
- その他の情報は[データサイエンス100本ノック（構造化データ加工編）](https://github.com/The-Japan-DataScientist-Society/100knocks-preprocess)をご確認ください
