class CommentsController < ApplicationController
  def new 
    @comment = Comment.new
  end
  
  def create
    @post = Post.find(create_params[:post_id])
    @comment = @post.comments.build(user_id: current_user.id, text: create_params[:text])
    @comment.save
    @posts = Post.all
    render "posts/index"
  end

  def index
    @post = Post.find(index_params[:post_id])
    @comments = @post.comments
  end
  private

  def create_params
    params.require(:comment).permit(:post_id, :text, :_method, :authenticity_token)
  end

  def index_params
    params.permit(:post_id)
  end
end