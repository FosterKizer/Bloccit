class CommentsController < ApplicationController

	def new
		@topic = Topic.find(params[:topic_id])
		@post = Post.find(params[:post_id])
		@comment = Comment.new
		authorize @comment
	end
  
	def create
		@topic = Topic.find(params[:topic_id])
		@post = Post.find(params[:post_id])
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
	
	
	private
	
	def comment_params
		params.require(:comment).permit(:body)
	end
end
