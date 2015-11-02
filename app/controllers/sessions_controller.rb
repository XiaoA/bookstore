class SessionsController < ApplicationController

  def new
    redirect_to root_path if current_user
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:success] = "Sign in successful"
      redirect_to root_path
    else
      flash.now[:danger] = "There was a problem with your email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully signed out."
    redirect_to root_path
  end
end
