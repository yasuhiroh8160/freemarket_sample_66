# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|varchar|null: false|
|email|varchar|null: false|
|password|varchar|null: false|
### Association
- has_many :sns_credentials, dependent: :destroy
- has_one :profile
- has_one :creditcard
- has_many :products, dependent: :destroy
- has_many :tradings, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|token|longtext|null: false|
|uid|varchar|null: false|
|provider|varchar|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belong_to :user


## profileテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|last_name|varchar|null: false|
|first_name|varchar|null: false|
|last_name_kana|varchar|null: false|
|first_name_kana|varchar|null: false|
|birth_year|varchar|null: false|
|birth_month|varchar|null: false|
|birth_day|varchar|null: false|
|phone_namber|varchar|null: false|
|zipcode|varchar|naull: false|
|prefecture|varchar|null: false|
|city|varchar|null: false|
|district|varchar|null: false|
|building|varchar|null: false|
|user_id|integer|null: false, forein_key: true|
### Association
- belong_to :user


## creditcardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|token|longtext|null:false|
### Association
- belong_to :user


## productテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
|price|varchar|null: false|
|description|varchar|null: false|
|brand|varchar|null: false|
|shipping_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|state_id|integer|null: false, foreign_key: true|
|status_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belong_to :user
- has_one :shipping
- has_many :images, dependent: :destroy
- belong_to :status
- belong_to :state
- belong_to :size
- belong_to :category
- has_one :order
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## shippingテーブル
|Column|Type|Options|
|------|----|-------|
|method|varchar|null: false|
|prefecture_from|varchar|null: false|
|period_before_shipping|varchar|null: false|
|fee_burden|varchar|null: false|
### Association
- belong_to :product



## imageテーブル
|Column|Type|Options|
|------|----|-------|
|url|varchar|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belong_to :product


## statusテーブル
|Column|Type|Options|
|------|----|-------|
|name|enum|null: false|
### Association
- has_many :products, dependent: :destroy


## stateテーブル
|Column|Type|Options|
|------|----|-------|
|name|enum|null: false|
### Association
- has_many :products, dependent: :destroy



## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|enum|null: false|
### Association
- has_many :products, dependent: :destroy


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
|child_id|string|null: false|
|grandchild_id|string|null: false|
### Association
- has_many :products, dependent: :destroy

## orderテーブル
|Column|Type|Options|
|------|----|-------|
|status|integer|null: false|
|trading_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- has_one :order
- belong_to :trading


## tradingテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false|
|buyer_id|integer|null: false|
### Association
- belong_to :user
- has_many :orders, dependent: :destroy
- has_many :reviews, dependent: :destroy

## reviewテーブル
|Column|Type|Options|
|------|----|-------|
|body|varchar|null: false|
|rating|integer|null: false|
|trading_id|integer|null: false, foreign_key: true|
### Association
- belong_to :trading

## commentテーブル
|Column|Type|Options|
|------|----|-------|
|body|longtext|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :product

## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :product


## brand_groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
### Association
- has_many :brands, dependent: :destroy


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
|brand_group_id|integer|null: false|
### Association
- belong_to :brand_group