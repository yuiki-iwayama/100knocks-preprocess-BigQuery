#!bin/bash

# プロジェクトの設定
gcloud auth activate-service-account $GCP_IAM --key-file=/run/secrets/user_gcp_key
gcloud config set project $GCP_PROJECT_ID
gcloud config set compute/region asia-northeast1
gcloud config set compute/zone b

# データをBigQueryへ流し込む
bq rm -f -r $GCP_PROJECT_ID:$GCP_DATA
bq --location=asia-northeast1 mk --dataset $GCP_PROJECT_ID:$GCP_DATA

# customer
bq --location=asia-northeast1 load \
--source_format=CSV --skip_leading_rows 1 \
$GCP_PROJECT_ID:$GCP_DATA.customer \
/work/data/customer.csv \
customer_id:STRING,customer_name:STRING,gender_cd:STRING,gender:STRING,birth_day:DATE,age:INT64,postal_cd:STRING,address:STRING,application_store_cd:STRING,application_date:STRING,status_cd:STRING

# category
bq --location=asia-northeast1 load \
--source_format=CSV --skip_leading_rows 1 \
$GCP_PROJECT_ID:$GCP_DATA.category \
/work/data/category.csv \
category_major_cd:STRING,category_major_name:STRING,category_medium_cd:STRING,category_medium_name:STRING,category_small_cd:STRING,category_small_name:STRING

# product
bq --location=asia-northeast1 load \
--source_format=CSV --skip_leading_rows 1 \
$GCP_PROJECT_ID:$GCP_DATA.product \
/work/data/product.csv \
product_cd:STRING,category_major_cd:STRING,category_medium_cd:STRING,category_small_cd:STRING,unit_price:INT64,unit_cost:INT64

# store
bq --location=asia-northeast1 load \
--source_format=CSV --skip_leading_rows 1 \
$GCP_PROJECT_ID:$GCP_DATA.store \
/work/data/store.csv \
store_cd:STRING,store_name:STRING,prefecture_cd:STRING,prefecture:STRING,address:STRING,address_kana:STRING,tel_no:STRING,longitude:NUMERIC,latitude:NUMERIC,floor_area:NUMERIC

# receipt
bq --location=asia-northeast1 load \
--source_format=CSV --skip_leading_rows 1 \
$GCP_PROJECT_ID:$GCP_DATA.receipt \
/work/data/receipt.csv \
sales_ymd:INT64,sales_epoch:INT64,store_cd:STRING,receipt_no:INT64,receipt_sub_no:INT64,customer_id:STRING,product_cd:STRING,quantity:INT64,amount:INT64

# geocode
bq --location=asia-northeast1 load \
--source_format=CSV --skip_leading_rows 1 \
$GCP_PROJECT_ID:$GCP_DATA.geocode \
/work/data/geocode.csv \
postal_cd:STRING,prefecture:STRING,city:STRING,town:STRING,street:STRING,address:STRING,full_address:STRING,longitude:NUMERIC,latitude:NUMERIC

jupyter lab --ip=0.0.0.0 --allow-root --LabApp.token=''
