class Category < ApplicationRecord
  has_many :products, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: true, length: { maximum: 80 }
  validates :description, presence: true
end
