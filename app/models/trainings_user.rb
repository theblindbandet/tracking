class TrainingsUser < ApplicationRecord
  belongs_to :training
  belongs_to :user
end
