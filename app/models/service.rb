class Service < ApplicationRecord
  belongs_to :user
  default_scope -> { order(meeting_time: :desc) }
  validates :user_id, presence: true
  validates :price, numericality: true
  validates_date :meeting_time
  
end
