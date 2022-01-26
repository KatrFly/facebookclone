class CommentsController < ApplicationController
  def new 
    @comment = Comment.new
  end
  
  def create
    @post = Posts.find(comment_params[:post_id])
    @comment =     
  end

  private

  def comment_params
    params.require().permit(:post_id, :text)
  end
end