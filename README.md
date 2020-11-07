# README

## users table

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| user_password         | string  | null: false |
| user_password_confirm | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_kana      | string  | null: false |
| first_name_kana       | string  | null: false |
| birth_year            | integer | null: false |
| birth_month           | integer | null: false |
| birth_day             | integer | null: false |


### Association
- has_many :products
- has_many :buyers


### products table

| Column            | Type      | Option                         |
| ----------------- | --------- | ------------------------------ | 
| image             |           | null: false                    |
| product_name      | string    | null: false                    |
| description       | text      | null: false                    |
| cost              | integer   | null: false                    |
| product_category  | string    | null: false                    |
| product_condition | string    | null: false                    |
| delivery_fee      | string    | null: false                    |
| prefecture        | string    | null: false                    |
| arrival_date      | integer   | null: false                    |
| users_id          | reference | null: false, foreign_key: true |
 

### Association
- belongs_to :users
- has_one :buyers


### sending_destination table

| Column       |Type       | Option                        |
| ------------ | --------  | ----------------------------- | 
| zip_code     | integer   | null:false                    |
| prefecture   | string    | null:false                    |
| city         | string    | null:false                    |
| address      | string    | null:false                    |
| building     | string    |                               | 
| phone_number | integer   | null:false                    |
| buyers_id    | reference | null:false, foreign_key: true |


### Association
- has_one :buyers


### buyers_table

| Column      |Type       | Option                        |
| ----------- | --------  | ----------------------------- | 
| users_id    | reference | null:false, foreign_key: true |
| products_id | reference | null:false, foreign_key: true |


### Association
- belongs_to :users
- has_one :products
- has_one :sending_destination
