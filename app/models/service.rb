class Service < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(meeting_time: :desc) }
end
