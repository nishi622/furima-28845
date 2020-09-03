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
| name1    | string   | null: false |
| name2    | string   | null: false |
| birthday | datetime | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column           | Type     | Options           |
| ---------------- | ---------| ------------------|
| item_name        | string   | null: false       |
| price            | integer  | null: false       |
| item_explanation | text     | null: false       |
| image            | string   | null: false       |
| user_id          | integer  | foreign_key: true |

### Association

- belongs_to :users
- has_many :comments
- has_one :buyers

## comments テーブル

| Column    | Type     | Options           |
| --------- | -------  | ----------------- |
| user_id   | integer  | foreign_key: true |
| item_id   | integer  | foreign_key: true |
| text      | text     | null: false       |

### Association

- belongs_to :users
- belongs_to :items

## buyers テーブル

| Column              | Type       | Options            |
| ------------------- | ---------- | -------------------|
| user_id             | integer    | foreign_key: true  |
| shopping_address    | string     | null: false        |

### Association

belongs_to :items