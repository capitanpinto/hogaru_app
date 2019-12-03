class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order
  default_scope -> { order(meeting_time: :desc) }
  validates :user_id, presence: true
  validates :order_id, presence: true
  validates :meeting_time, presence: true
  validate :correct_date
  validate :notsunday
  validate :right_address
  validates :maid_id, presence: true
  validates :address, presence: true
  
  def right_address
    if address.user_id != user_id
      errors.add( :user_id, "you can't order a service to comeone else's address")
    end
  end
  
  def notsunday
    if meeting_time.sunday?
      errors.add( :meeting_time, "We don't offer services on Sundays")
    end
  end
  
  def correct_date
    if meeting_time <= Time.now
      errors.add( :meeting_time, "has to be at least a day later than today")
    end
  end
end

