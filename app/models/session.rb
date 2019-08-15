# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, uniqueness: true

  def start_time
    Time.parse(created_at.to_s)
  end
end
