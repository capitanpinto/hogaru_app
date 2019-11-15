class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order
  default_scope -> { order(meeting_time: :desc) }
  validates :user_id, presence: true
  validates :order_id, presence: true
  validates :meeting_time, presence: true
  validates :address, presence: true
  
end
