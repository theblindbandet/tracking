class LoginRecord < ApplicationRecord
  belongs_to :user
  validates :user_id,       presence: true
  validates :date,          presence: true
  validates :logged_in_at,  presence: true
  validates :logged_out_at, presence: true
end
