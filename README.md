# テーブル設計

## usersテーブル

| Column               | Type     | Options       |
| -------------------- | -------  | ------------- |
| nickname             | string   | null false    |
| email                | string   | null false    |
| encrypted_password   | string   | null false    |
| last_name            | string   | null false    |
| first_name           | string   | null false    |
| last_name_kana       | string   | null false    |
| first_name_kana      | string   | null false    |
| birth_date           | datetime | null false    |


### Association

- has_many :items
- has_many :orders

##  itemsテーブル

| Column                  | Type        | Option                         |
| ----------------------- | ----------- | ------------------------------ |
| name                    | string      | null false                     |
| info                    | text        | null false                     |
| category_id             | integer     | null false                     |
| sales_status_id         | integer     | null false                     |
| shipping_free_status_id | integer     | null false                     |
| prefecture_id           | integer     | null false                     |
| scheduled_id            | integer     | null false                     |
| price                   | integer     | null false                     |
| user                    | references  | null false foreign_key: true   |

### Association

- belongs_to :user
- has_one    :order

## ordersテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| user            | references | null false foreign_key: true   |
| item            | references | null false foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippingテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null false                     |
| prefecture_id      | integer    | null false                     |
| city               | string     | null false                     |
| addresses          | string     | null false                     |
| building           | string     |                                |
| phone_number       | string     | null false                     |
| order              | references | null false foreign_key: true   |

### Association
 
- belongs_to :order

