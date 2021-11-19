class Space < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many_attached :photos
  belongs_to :user
  has_many :bookings

  CATEGORIES = ["restaurant", "cafe", "coffee stand", "gallery", "retail space", "food-truck", "atelier", "antique shop", "cake shop", "event space", "seminar room"]
  TENTATIVE_ADDRESSES = [
    "1 Chome-11-3 Meguro,  Tokyo 153-0063",
    "2 Chome-24-2 Sendagaya, Tokyo 151-8580",
    "3 Chome−７ Kanagawa, Yokohama, 225-0002",
    "4 Chome-22-6 Jinnan, Tokyo 150-0041",
    "5 Chome-24-12 Shibuya, Tokyo 150-0002",
    "6 Chome-10-1 Ginza, Tokyo 104-0061",
    "7-50-10, Honcho, Naka-ku, Yokohama 231-0005",
    "7 Chome-14-15 Ginza, Tokyo 104-0061",
    "6-chōme-50-10 Honchō, Naka Ward, Yokohama, Kanagawa 231-0005",
    "1-1 Udagawachō, Shibuya, Tokyo 150-8010",
    "13-11 Udagawachō, Shibuya, Tokyo 150-8010",
    "3-3 Udagawacho, Shibuya City, Tokyo 150-0042",
    "1 Chome-6-12 Jinnan, Shibuya City, Tokyo 150-0041",
    "1 Chome-16-11 Tomigaya, Shibuya City, Tokyo 151-0063",
    "1 Chome-1 Shinko, Naka Ward, Yokohama, Kanagawa 231-0001",
    "163 Yamashitacho, Naka Ward, Yokohama, Kanagawa 231-0023",
    "1 Chome Minatocho, Naka Ward, Yokohama, Kanagawa 231-0017",
    "Yoshidamachi 65, Yokohama, Kanagawa 231-0041",
    "3 Chome-5-12 Ginza, Chuo City, Tokyo 104-0061",
    "4 Chome−4−5 Ginza, Chuo City, Tokyo, 104-0061"
  ]
  MEGURO_ADDRESSES = [
    "3 Chome-1-1 Meguro, Tokyo 153-0063",
    "2 Chome-11-3 Meguro, Tokyo 153-0063",
    "3 Chome-9 Meguro, Tokyo 153-0063",
    "2 Chome-10-1 Meguro, Tokyo 153-0063",
    "2 Chome-4-36 Meguro, Tokyo 153-0063",
    "3 Chome-10-13 Meguro, Tokyo 153-0063"
  ]
  TENTATIVE_NEIGHB_MESSAGES = ["Lots of foot traffic. Great for retail.", "Quiet residential neiborhood with a lot of wealthy residents. Good for upper market retails stores.", "Close to office area and you can expect lots of customers for lunch on week days; not many people around on weekends"]
  SAFETY_NOTE = ["Fire station is nearby", "Police station is nearby", "Fire insurance included.", "Fire extinguisher ready."]
  AMENITIES = ["Playstation", "Kitchen", "Coffee machine", "Sink", "Lounge", "Bathroom", "Bar area"]

  validates :category, inclusion: { in: CATEGORIES }
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  # validates :address, presence: true, uniqueness: true
  validates :size, presence: true, numericality: { only_integer: true }
end
