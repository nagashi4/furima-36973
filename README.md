 テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_day          | date    | null: false |




### Association

- has_many :items
- has_many :purchases
- has_many :address

## items テーブル

| Column              | Type       | Options                        |
| ------              | ------     | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| name                | references | null: false, foreign_key: true |
| version             | text       | null: false                    |
| category            | string     | null: false                    |
| situation           | string     | null: false                    |
| delivery_charge     | string     | null: false                    |
| delivery_area       | string     | null: false                    |
| delivery_days       | string     | null: false                    |
| price               | integer    | null: false                    |



### Association

- belongs_to :users
- has_one :purchases
- has_many :address

## purchases テーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| name                | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :items
- has_one :address

## address テーブル

| Column              | Type       | Options                        |
| -------             | ---------- | ------------------------------ |
| post_code           | integer    | null: false                    |
| prefectures         | string     | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | integer    | null: false                    |
| building_name       | string     |                                |
| telephone_number    | integer    | null: false                    |



### Association

- belongs_to :user
- has_one_ :items
- has_one_ :purchases
