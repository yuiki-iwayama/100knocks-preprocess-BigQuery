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
[ステップ 1: Google Cloud アカウントを作成する](https://cloud.google.com/apigee/docs/hybrid/v1.2/precog-gcpaccount?hl=ja)をご参照ください

## プロジェクトの作成
[ステップ 2: Google Cloud プロジェクトを作成する](https://cloud.google.com/apigee/docs/hybrid/v1.2/precog-gcpproject?hl=ja)をご参照ください

## サービスアカウントキーの作成
[サービス アカウントを使用して承認する](https://cloud.google.com/sdk/docs/authorizing?hl=ja#authorizing_with_a_service_account)をご参照ください

# Install
- buildする前に以下の項目を`.env`に必要事項を記載してください
1. `GCP_KEY_PATH=`作成したサービスアカウントキーのパス
2. `GCP_IAM=`サービスアカウント情報
3. `GCP_PROJECT_ID=`プロジェクトID
4. `GCP_DATA=`作りたいデータセット名

```
$ git clone git@github.com:yuiki-iwayama/100knocks-preprocess-BigQuery.git
$ cd 100knocks-preprocess-BigQuery
$ docker-compose up -d --build
```

# Usage
- ブラウザで[http://localhost:8888](http://localhost:8888)にアクセスします

# Document
- work配下にBigQuery/Pythonの設問notebookを配置
- work/dataにデータセットを配置
- その他の情報は[データサイエンス100本ノック（構造化データ加工編）](https://github.com/The-Japan-DataScientist-Society/100knocks-preprocess)をご確認ください
