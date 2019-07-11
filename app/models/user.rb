class User < ApplicationRecord
  has_one :session, dependent: :destroy
  has_many :login_records, dependent: :destroy
  before_save {email.downcase!}

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :email, presence: true, uniqueness: {case_sensitive: false},
            length: {maximum: 255},
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  validates :total_hours, presence: true, numericality: {greater_than_or_equal_to: 0}

  def add_hours(hours)
    puts "hours: #{hours}"
    self.total_hours += hours
    puts "this user's total hours: #{self.total_hours}"
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
