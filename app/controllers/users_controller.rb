class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(users_params)

    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      flash[:error_messages] = user.errors.full_messages
      flash[:user] = user
      redirect_back fallback_location: new_user_path
    end
  end

  def me
  end

  private

  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
