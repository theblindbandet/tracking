class SessionsController < ApplicationController
  def create
    user = User.find(params[:id])
    if user && user.authenticate(params[:password])
      log_in user unless logged_in? user
      flash.now[:success] = "Successfully logged in!" 
    else
      flash.now[:danger] = 'Invalid user/password combination'
    end
    render 'new'
  end

  def destroy
    user = User.find(params[:id])
    if logged_in? user
      record = user.login_records.build(date: Date::today, 
                                        logged_in_at: user.session.start_time, 
                                        logged_out_at: Time.now)
      record.save
      user.add_hours (record.logged_out_at - record.logged_in_at) / 3600
      user.save
      log_out user 
    end
    flash.now[:success] = "Successfully logged out!"
    render 'logout'
  end
end
