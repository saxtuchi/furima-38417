class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :info, presence: true
  validates :category_id , numericality: { other_than: 1 , message: "can't be blank" }
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_free_status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank" }
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: "半角文字を使用してください" } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: "can't be blank" }
  end
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_free_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end