class Space < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["restaurant", "cafe", "coffee stand", "gallery", "retail space", "food-truck", "atelier"]
  validates :category, inclusion: { in: CATEGORY }
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :address, presence: true, uniquness: true
  validates :size, presence: true, numericality: { only_integer: true }
end
