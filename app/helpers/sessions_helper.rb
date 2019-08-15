# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    Session.create!(user_id: user.id)
  end

  def logged_in?(user)
    Session.find_by(user_id: user.id) ? true : false
  end

  def log_out(user)
    user.session.destroy!
  end

  def create_record(session)
    record = session.user.login_records.build(date: Date.today,
                                              logged_in_at: session.start_time,
                                              logged_out_at: Time.now)
    record.save
  end
end
