class BreadStore < ActiveRecord::Base
  validates :name, length: {minimum: 2}
  validates :phone_number, format: { with: /\A([0-9]+[-]*[0-9]+)+\Z/}
  validates :address, presence: true
end
