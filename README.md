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
- has_many :shippings

##  itemsテーブル

| Column               | Type        | Option                         |
| -------------------- | ----------- | ------------------------------ |
| name                 | string      | null false                     |
| info                 | text        | null false                     |
| category             | string      | null false                     |
| sales_status         | string      | null false                     |
| shipping_free_status | string      | null false                     |
| prefecture           | string      | null false                     |
| scheduled            | string      | null false                     |
| price                | integer     | null false                     |
| user                 | references  | null false foreign_key: true   |

### Association

- belongs_to :user
- has_one    :order
- has_one    :shipping

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

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null false                     |
| prefecture      | string     | null false                     |
| city            | string     | null false                     |
| addresses       | string     | null false                     |
| building        | string     | null false                     |
| phone_number    | string     | null false                     |
| user            | references | null false foreign_key: true   |
| item            | references | null false foreign_key: true   |
| order           | references | null false foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order

