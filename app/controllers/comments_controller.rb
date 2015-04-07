class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:id])
	@comment = Comment.new
	authorize @comment
  end
  
  def create
    @topic = Topic.find(params[:id])
    @post = Post.find(params[:id])
    @comment = current_user.comments.build(comment_params)
	@comment.post = @post 
	authorize @comment
	if @comment.save
		flash[:notice] = "Comment was saved successfully"
		redirect_to [@topic, @post, @post.comments]
	else
		flash[:error] = "Error creating comment. Please try again."
		render :new
	end
  end
	
	
	private
	
	def comment_params
		params.require(:comment).permit(:body)
  
end
