class HomeController < ApplicationController
	def index
		if session[:id]
			@posts = Post.all 
			render "users/index"
		else
			render "home/index"
		end
	end
end
