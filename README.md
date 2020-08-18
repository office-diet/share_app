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
- has_many :rents
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
- has_many :rents

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
* 将来的には、imageはActiveHashで実装

### Association

- has_many :items
- has_many :products_genre
- has_many :reviews

## items テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| condition_id  | integer     | null: false (ActiveHash)       |
| text          | string      | null: false                    |
| goods_id      | references  | null: false, foreign_key: true |

### Association

- belongs_to :good
- has_many: rents

## rents テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| return      | boolean     | default: false                 |
| item_id     | references  | null: false, foreign_key: true |
| user_id     | references  | null: false, foreign_key: true |
| address_id  | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address
- belongs_to :item

## products_genre テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| products_id | references  | null: false, foreign_key: true |
| genre_id    | integer     | null: false (ActiveHash)       |

### Association

- belongs_to :products

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

