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
      create_record user.session
      log_out user 
    end
    flash.now[:success] = "Successfully logged out!"
    render 'logout'
  end
end
