class Space < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORIES = ["restaurant", "cafe", "coffee stand", "gallery", "retail space", "food-truck", "atelier"]
  TENTATIVE_ADDRESSES = ["1 Chome-11-3 Meguro,  Tokyo 153-0063",
    "2 Chome-24-2 Sendagaya, Tokyo 151-8580", "3 Chome−７ Kanagawa, Yokohama, 225-0002",
    "4 Chome-22-6 Jinnan, Tokyo 150-0041", "5 Chome-24-12 Shibuya, Tokyo 150-0002", "6 Chome-10-1 Ginza, Tokyo 104-0061", "7-50-10, Honcho, Naka-ku, Yokohama 231-0005", "7 Chome-14-15 Ginza, Tokyo 104-0061",
    "6-chōme-50-10 Honchō, Naka Ward, Yokohama, Kanagawa 231-0005", "1-1 Udagawachō, Shibuya, Tokyo 150-8010"]
  TENTATIVE_NEIGHB_MESSAGES = ["Lots of foot traffic. Great for retail.", "Quiet residential neiborhood with a lot of wealthy residents. Good for upper market retails stores.", "Close to office area and you can expect lots of customers for lunch on week days; not many people around on weekends"]
  SAFETY_NOTE = ["Fire station is nearby", "Police station is nearby", "Fire insurance included.", "Fire extinguisher ready."]
  AMENITIES = ["Playstation", "Kitchen", "Coffee machine", "Sink", "Lounge", "Bathroom", "Bar area"]

  validates :category, inclusion: { in: CATEGORIES }
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  # validates :address, presence: true, uniqueness: true
  validates :size, presence: true, numericality: { only_integer: true }

  has_one_attached :photo


end
