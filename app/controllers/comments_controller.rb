class CommentsController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
		authorize @comment
	end
  
	def create
		@topic = @post.topic
		@post = @topic.posts.find(params[:post_id])
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
		@topic = @post.topic
		@post = @topic.posts.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		authorize @comment 
		if @comment.destroy
			flash[:notice] = "Comment was removed."
			redirect_to [@topic, @post]
		else
			flash[:error] = "Comment couldn't be deleted. Try again."
			redirect_to [@topic, @post]
		end
	end
	
	private
	
	def comment_params
		params.require(:comment).permit(:body)
	end
end
