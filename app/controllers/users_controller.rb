class UsersController < ApplicationController

  def login
    @user = User.new
  end

  def logar
    @user = User.find_by(name: params[:user][:name])
    if params[:user][:password].crypt(@user.name) == @user.password
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_users_path
    end
  end

  def show
  end

  private

    def user_params
      params.require(:user).permit(:name, :password)
    end
end
