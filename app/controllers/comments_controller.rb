class CommentsController < ApplicationController

	def show

	end

	def new
		@comment = Comment.new
	end

	def create


		@post = Post.find(params[:post_id])

		@comment = Comment.new(comment_params)
		@comment.user_id = session[:id]
		@comment.post_id = @post.id

		if @comment.save
			redirect_to posts_path
		else
			render 'new'
		end
	end


	private

	  	def comment_params
	    	params.require(:comment).permit(:body)
	  	end

end
