class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:session][:id])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash.now[:success] = "Successfully logged in!" 
    else
      flash.now[:danger] = 'Invalid user/password combination'
    end
    render 'new'
  end

  def destroy
  end
end
