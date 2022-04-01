# テーブル設計

## users

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false , unique: true|
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association
has_many :items
has_many :orders

## items

| Column                  | Type      | Options                        |
|-------------------------|-----------|--------------------------------|
| name                    | string    | null: false                    |
| info                    | text      | null: false                    |
| category_id             | integer   | null: false                    |
| status_id               | integer   | null: false                    |
| shopping_fee_status_id  | integer   | null: false                    |
| prefecture_id           | integer   | null: false                    |
| scheduled_delivery_id   | integer   | null: false                    |
| price                   | integer   | null: false                    |
| user                    | reference | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :order
has_one_attached :image

## orders

| Column          | Type      | Options                        |
|-----------------|-----------|--------------------------------|
| user            | reference | null: false, foreign_key: true |
| item            | reference | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :delivery


## deliveries

| Column          | Type      | Options                        |
|-----------------|-----------|--------------------------------|
| postal_code     | string    | null: false                    |
| prefecture_id   | integer   | null: false                    |
| city            | string    | null: false                    |
| addresses       | string    | null: false                    |
| building        | string    |                                |
| phone_number    | string    | null: false                    |
| order           | reference | null: false, foreign_key: true |

### Association
belongs_to :order