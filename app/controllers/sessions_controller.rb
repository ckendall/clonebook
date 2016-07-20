class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      session[:id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid Password and Email"
      render 'sessions/new'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end
end
