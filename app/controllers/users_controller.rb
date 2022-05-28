class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def create
    user =User.new(user_params)
    if user.save
      session[:user_id]= user.id
      redirect_to root_path, notice: "You have successfully signed in"
    else
      render:new 
    end 
  end

  def show
    @user = User.find(params[:id])

  end

  def account
    @user = User.find(params[:id])

  end

  def profile
    @user = User.find(params[:id])
    @image = @user.image

  end



def update
  @user = User.find(params[:id])
  if @user.update(params.require(:user).permit(:name, :email, :password,:image,:self_introduction ))
    flash[:notine] = "Profile was successfully updated."
    redirect_to profile_user_path(current_user.id)

  else
    flash.now[:danger] = "ユーザーを更新できませんでした"
    render :profile
  end
end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

