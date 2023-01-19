class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :info, presence: true
  validates :category_id , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_free_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_free_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end