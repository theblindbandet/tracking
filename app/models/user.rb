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

  def total_hours
    if not self.login_records.empty?
      seconds = self.login_records.map{|r| r.logged_out_at - r.logged_in_at }.reduce(:+)
      return seconds / 3600
    end
    return 0
  end

  def logged_in_since
    session.created_at.localtime.to_s
  end

  def logged_in?
    self.session ? true : false
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.logged_in_users
    User.joins(:session).where.not(session: nil)
  end

  def User.logged_out_users
    User.joins("LEFT JOIN sessions ON users.id = sessions.user_id").where("sessions.user_id IS NULL")
  end
end
