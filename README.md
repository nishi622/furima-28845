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

## users テーブル

| Column           | Type     | Options     |
| ---------------- | ------   | ----------- |
| name             | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| last_name_kanzi  | string   | null: false |
| first_name_kanzi | string   | null: false |
| last_name_kana   | string   | null: false |
| first_name_kana  | string   | null: false |
| birthday         | date     | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column           | Type     | Options           |
| ---------------- | ---------| ------------------|
| name             | string   | null: false       |
| category         | integer  | null: false       |
| status           | integer  | null: false       |
| delivery_fee     | integer  | null: false       |
| delivery_area    | integer  | null: false       |
| delivery_days    | integer  | null: false       |
| price            | integer  | null: false       |
| explanation      | text     | null: false       |
| user_id          | integer  | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column              | Type       | Options            |
| ------------------- | ---------- | -------------------|
| user_id             | integer    | foreign_key: true  |
| item_id             | integer    | foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one : address

## addresses テーブル

| Column           | Type     | Options           |
| ---------------- | ---------| ------------------|
| postal_code      | string   | null: false       |
| prefecture       | integer  | null: false       |
| city             | string   | null: false       |
| banti            | string   | null: false       |
| building_name    | string   |                   |
| phone_number     | string   | null: false       |
| buyer_id         | integer  | foreign_key: true |

### Association

-belongs_to :buyer