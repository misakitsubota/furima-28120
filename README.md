# README

## users table

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_kana      | string  | null: false |
| first_name_kana       | string  | null: false |
| birth_day             | date    | null: false |


### Association
- has_many :products
- has_many :buyers


### products table

| Column               | Type       | Option                         |
| -----------------    | ---------  | ------------------------------ | 
| product_name         | string     | null: false                    |
| description          | text       | null: false                    |
| cost                 | integer    | null: false                    |
| product_category_id  | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| arrival_date_id      | integer    | null: false                    |
| user_id              | integer    | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :buyer


### sending_destination table

| Column        |Type       | Option                        |
| ------------  | --------  | ----------------------------- | 
| zip_code      | string    | null:false                    |
| prefecture_id | integer   | null:false                    |
| city          | string    | null:false                    |
| address       | string    | null:false                    |
| building      | string    |                               | 
| phone_number  | string    | null:false                    |
| buyer_id      | integer   | null:false, foreign_key: true |


### Association
- belongs_to :buyer


### buyers_table

| Column      |Type     | Option                        |
| ----------- | ------- | ----------------------------- | 
| user_id    | integer | null:false, foreign_key: true |
| product_id | integer | null:false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :product
- has_one :sending_destination
