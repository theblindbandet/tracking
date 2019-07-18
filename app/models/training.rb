class Training < ApplicationRecord
  has_and_belongs_to_many :students
  validates :title, presence: true, length: {maximum: 255}
  validates :length, presence: true
end
