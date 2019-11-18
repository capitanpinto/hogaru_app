class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order
  default_scope -> { order(meeting_time: :desc) }
  validates :user_id, presence: true
  validates :order_id, presence: true
  validates :meeting_time, presence: true
  validate :correct_date
  
  def correct_date
    if meeting_time <Time.now
      errors.add( :meeting_time, "has to be at least a day later than today")
    end
  end
  validates :address, presence: true
end