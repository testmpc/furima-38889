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
| date_of_birth      | date       | null: false                    |

## exhibits テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |  

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| exhibit            | references | null: false, foreign_key: true |


## addresses テーブル
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| municipality       | string     | null: false                    |
| block_number       | string     | null: false                    |
| building           | string     | null: false                    |
| tel_number         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| exhibits           | references | null: false, foreign_key: true |
