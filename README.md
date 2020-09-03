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

| Column   | Type     | Options     |
| -------- | ------   | ----------- |
| name     | string   | null: false |
| email    | string   | null: false |
| password | string   | null: false |
| last_name_kanzi    | string   | null: false |
| first_name_kanzi    | string   | null: false |
| last_name_kana    | string   | null: false |
| first_name_kana    | string   | null: false |
| birthday | datetime | null: false |

### Association

- has_many :items

## items テーブル

| Column           | Type     | Options           |
| ---------------- | ---------| ------------------|
| name             | string   | null: false       |
| category         | string   | null: false       |
| status           | string   | null: false       |
| delivery_fee     | string   | null: false       |
| delivery_area    | string   | null: false       |
| delivery_days    | string   | null: false       |
| price            | integer  | null: false       |
| explanation      | text     | null: false       |
| user_id          | integer  | foreign_key: true |

### Association

- belongs_to :users
- has_one :buyers


## buyers テーブル

| Column              | Type       | Options            |
| ------------------- | ---------- | -------------------|
| user_id             | integer    | foreign_key: true  |
| shopping_address    | string     | null: false        |

### Association

belongs_to :items