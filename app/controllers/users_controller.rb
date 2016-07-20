class UsersController < ApplicationController
  include SessionsHelper

  def index

    @posts = Post.find_by(user_id)

  end

  def new
    @user = User.new
    @post = Post.new
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
      params.require(:user).permit(:name, :email, :password)
    end

end
