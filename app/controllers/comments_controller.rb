class CommentsController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
		authorize @comment
	end
  
	def create
		@post = Post.find(params[:post_id])
		@topic = @post.topic
		@comment = current_user.comments.build(comment_params)
		@comment.post = @post
		authorize @comment
		if @comment.save
			flash[:notice] = "Comment was saved successfully"
			redirect_to [@topic, @post]
		else
			flash[:error] = "Error creating comment. Please try again."
			redirect_to [@topic, @post]
		end
	end
	
	def destroy
		@post = Post.find(params[:post_id])
		@topic = @post.topic
		@comment = @post.comments.find(params[:id])
		authorize @comment 
		if @comment.destroy
			flash[:notice] = "Comment was removed."
		else
			flash[:error] = "Comment couldn't be deleted. Try again."
		end
		
		respond_to do |format|
			format.html
			format.js
		end
	end
	
	private
	
	def comment_params
		params.require(:comment).permit(:body)
	end
end
