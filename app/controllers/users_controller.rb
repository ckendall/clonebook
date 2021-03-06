class UsersController < ApplicationController
  include SessionsHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      session[:id] = @user.id
      redirect_to posts_path
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
