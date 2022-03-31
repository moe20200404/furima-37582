# テーブル設計

## users

| Column          | Type   | Options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |


### Association
has_many :items
has_many :orders

## items

| Column              | Type   | Options     |
|---------------------|--------|-------------|
| name                | string | null: false |
| info                | string | null: false |
| category            | string | null: false |
| shopping_fee_status | string | null: false |
| prefecture          | string | null: false |
| scheduled_delivery  | string | null: false |
| price               | string | null: false |


### Association
belongs_to :user
has_one :order

## orders

| Column          | Type   | Options     |
|-----------------|--------|-------------|
| card_info       | string | null: false |
| postal_code     | string | null: false |
| prefecture      | string | null: false |
| city            | string | null: false |
| addresses       | string | null: false |
| building        | string | null: false |
| phone_number    | string | null: false |


### Association
belongs_to :user
belongs_to :item
