class FriendshipsController < ApplicationController
  def create
    @inviter = User.find(friendship_params[:inviter_id])
    @friend_request = FriendRequest.find(friendship_params[:friend_request])
    if Friendship.create(user_id: friendship_params[:inviter_id], friend_id: current_user.id)
      flash.now[:notice] = "You are now friends with #{@inviter.username}"
      @friend_request.destroy
      render "friend_requests/index"
    end
  end

  def index
  end

  def show

  end

  private
  
  def friendship_params
    params.permit(:_method, :inviter_id, :authenticity_token, :friend_request)
  end
end