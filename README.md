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



# テーブル設計

## users テーブル（Devise）

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| nickname          | string | null: false, unique: true |
| family_name       | string | null: false               |
| first_name        | string | null: false               |
| family_name_kana  | string | null: false               |
| first_name_kana   | string | null: false               |
| birthday          | date   | null: false               |
| email             | string | null: false               |
| password          | string | null: false               |

### Association

- has_many :cards
- has_many :address
- has_many :sends
- has_many :reviews

## addresses テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| name          | string      | null: false                    |
| postal_code   | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| town          | string      | null: false                    |
| address       | string      | null: false                    |
| building      | string      |                                |
| tel           | string      | null: false                    |
| user_id       | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :sends

## cards テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| card_token      | string      | null: false                    |
| customer_token  | string      | null: false                    |
| user_id         | references  | null: false, foreign_key: true |

### Association

- belongs_to :user

## products テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| name    | string  | null: false |
| image   | string  | null: false |
* imageは将来、ActiveStorageで実装

### Association

- has_many :items
- has_many :products_genres
- has_many :genres, through :products_genres
- has_many :reviews

## items テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| condition_id  | integer     | null: false (ActiveHash)       |
| text          | string      | null: false                    |
| product_id    | references  | null: false, foreign_key: true |

### Association

- belongs_to :product
- has_many :sends

## sends テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| item_id       | references  | null: false, foreign_key: true |
| user_id       | references  | null: false, foreign_key: true |
| address_id    | references  | null: false, foreign_key: true |
| return(予備)  | boolean     | default: false                 |

### Association

- belongs_to :user
- belongs_to :address
- belongs_to :item

## products_genre テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| products_id | references  | null: false, foreign_key: true |
| genre_id    | references  | null: false, foreign_key: true |

### Association

- belongs_to :products
- belongs_to :genre

## genre テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| name    | string  | null: false |

### Association

- has_many :products_genres
- has_many :products, throuth :products_genres

## reviews テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| start       | integer     | null: false                    |
| text        | string      | null: false (ActiveHash)       |
| products_id | references  | null: false, foreign_key: true |
| user_id     | references  | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

