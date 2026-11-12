class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  validates :name, :description, :skin_type, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :source_code, presence: true, uniqueness: true
  scope :alphabetical, -> { order(:name) }
end
