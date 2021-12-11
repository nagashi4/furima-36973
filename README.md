 テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | -----------               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |




### Association


- has_many :purchases
- has_many :items


## items テーブル

| Column              | Type       | Options                        |
| ------              | ------     | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| name                | string     | null: false |
| version_id          | text       | null: false                    |
| category_id         | integer    | null: false                    |
| situation_id        | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| delivery_area_id    | integer    | null: false                    |
| delivery_days_id    | integer    | null: false                    |
| price               | integer    | null: false                    |



### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column              | Type       | Options                        |
| -------             | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefectures_id      | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| telephone_number    | string     | null: false                    |



### Association


- belongs_to :purchase
