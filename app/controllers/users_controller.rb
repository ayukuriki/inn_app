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
    @user = User.find(params[:sesison_id])
  end
  def show
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  if @user.update(params.require(:user).permit( :email, :password))
    flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
    redirect_to :user_path
  else
    render "edit"
  end
end

  private
  def user_params
    params.require(:user).permit(:email, :password, :passoword_confirmation)
  end
end

