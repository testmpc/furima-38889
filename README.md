# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_furigana      | string     | null: false                    |
| first_furigana     | string     | null: false                    |
| year_of_birth      | date       | null: false                    |
| month_of_birth     | date       | null: false                    |
| day_of_birth       | date       | null: false                    |

## exhibit テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| name               | text       | null: false                    |
| explanation        | text       | null: false                    |
| category           | string     | null: false                    |
| situation          | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| region_of_origin   | string     | null: false                    |
| days_to_ship       | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |  

## purchase テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_information   | integer    | null: false                    |
| valid_period       | date       | null: false                    |
| security_code      | integer    | null: false                    |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| tel_number         | integer    | null: false                    |
| exhibit            | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |