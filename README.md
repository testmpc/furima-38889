# テーブル設計

## users テーブル
has_many :items
has_many :orders

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_furigana      | string     | null: false                    |
| first_furigana     | string     | null: false                    |
| date_of_birth      | date       | null: false                    |

## items テーブル
belongs_to :user
has_one    :order

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| region_of_origin_id| integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## orders テーブル
belongs_to :user
belongs_to :item
has_one    :address

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## addresses テーブル
belongs_to :order

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| region_of_origin_id| integer    | null: false                    |
| municipality       | string     | null: false                    |
| block_number       | string     | null: false                    |
| building           | string     |                                |
| tel_number         | string     | null: false                    |
| order              | references | null: false, foreign_key: true |