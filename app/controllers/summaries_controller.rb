class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:format])
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    if @summary.save
      redirect_to [@topic, @post, @summary]
      flash[:notice] = "Summary was saved successfully"
    else
      flash[:error] = "Error in creating summary. Please try again"
      render :new
    end
  end
end
