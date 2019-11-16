class Address < ApplicationRecord
  belongs_to :user
  validates :location, presence: true 
  validates :user_id, presence: true
end
