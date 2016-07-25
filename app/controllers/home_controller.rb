class HomeController < ApplicationController
	def index
		if session[:id]
			@posts = Post.all 

			redirect_to posts_path
		else
			render "home/index"
		end
	end
end
