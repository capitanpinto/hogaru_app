class Service < ApplicationRecord
  belongs_to :user
  default_scope -> { order(meeting_time: :desc) }
  validates :user_id, presence: true
  validates :price, numericality: true
  validates :meeting_time, presence: true
  validates :address, presence: true
  
end
