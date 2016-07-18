class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
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
