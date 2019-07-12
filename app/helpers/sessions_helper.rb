module SessionsHelper
  def log_in(user)
    Session.create(user_id: user.id)
  end

  def logged_in?(user)
    Session.find_by(user_id: user.id) ? true : false
  end

  def log_out(user)
    user.session.destroy
  end
end