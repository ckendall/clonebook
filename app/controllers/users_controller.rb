class UsersController < ApplicationController
  include SessionsHelper

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :username, :password)
    end

end
