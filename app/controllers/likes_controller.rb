class LikesController < ApplicationController
  def create
    @post = Post.find(likes_params[:post_id])
    @like = @post.likes.build(post_id: likes_params[:post_id], user_id: current_user.id)
    @like.save
    @posts = Post.all
    render "posts/index"
  end

  private
  
  def likes_params
    params.permit(:_method, :post_id, :authenticity_token)
  end
end