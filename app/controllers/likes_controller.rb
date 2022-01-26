class LikesController < ApplicationController
  def create
    @post = Post.find(likes_params[:post_id])
    unless Like.check_if_like_already_exists(@post.likes, current_user.id)
      @like = @post.likes.build(post_id: likes_params[:post_id], user_id: current_user.id)
      @like.save 
    end
    @posts = Post.all
    render "posts/index"
  end

  def index
    @post = Post.find(likes_params[:post_id])
    @likes = @post.likes
  end

  private
  
  def likes_params
    params.permit(:_method, :post_id, :authenticity_token)
  end
end