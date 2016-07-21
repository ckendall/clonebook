class CommentsController < ApplicationController

	def show

	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)

		if @comment.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	private

	  	def comment_params
	    	params.require(:comments).permit(:body)
	  	end

end
