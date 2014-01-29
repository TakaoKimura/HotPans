class BreadStore < ActiveRecord::Base
  belongs_to :bread_store_manager
  has_many :breads  
  validates :name, length: {minimum: 2}
  validates :phone_number, format: { with: /\A([0-9]+[-]*[0-9]+)+\Z/}
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
end
