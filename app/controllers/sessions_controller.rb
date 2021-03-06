class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user, notice: "Welcome back, #{user.name}!"
    else
      flash.now[:alert] = "Combination Email/Password is invalid!"
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_path
  end
end