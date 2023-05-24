# テーブル設計

## users テーブル
has_many :exhibits
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

## exhibits テーブル
belongs_to :user
has_many :orders

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | string     | null: false                    |
| situation_id       | string     | null: false                    |
| delivery_charge_id | string     | null: false                    |
| region_of_origin_id| string     | null: false                    |
| days_to_ship_id    | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |  

## orders テーブル
belongs_to :user
belongs_to :exhibit
has_many :addresses

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| exhibit            | references | null: false, foreign_key: true |


## addresses テーブル
belongs_to :order

| post_code          | string     | null: false                    |
| region_of_origin_id| string     | null: false                    |
| municipality       | string     | null: false                    |
| block_number       | string     | null: false                    |
| building           | string     |                                |
| tel_number         | string     | null: false                    |
| order              | references | null: false, foreign_key: true |