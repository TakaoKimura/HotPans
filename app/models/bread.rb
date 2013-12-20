class Bread < ActiveRecord::Base
  belongs_to :bread_store
  validates :name, length: {minimum: 2}
end
