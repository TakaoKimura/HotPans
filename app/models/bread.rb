class Bread < ActiveRecord::Base
  belongs_to :bread_store
  validates :name, length: {minimum: 2}
  (default_scope :order => 'id')
end
