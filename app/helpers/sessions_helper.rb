module SessionsHelper
	def current_user
    	@current_user ||= User.find(session[:id])
  	end

  	def logged_in?
    	!current_user.nil?
  	end
end
