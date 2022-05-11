class SessionsController < ApplicationController
  def new
    if session[:user_id]
      @notice = "#{session[:user_name]}でログインしています。"
    end

  end

  def create
    user =User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]= user.id
      redirect_to root_path, notice: "You have successfully logged in."
    else
      flash.now[:alert]="Email or Password is invalid."
      render :new
    end
  end

  def destroy
    sessions[:user_id] = nil;
    redirect_to root_path;
  end


end
