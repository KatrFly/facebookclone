class FriendRequestsController < ApplicationController
  def new
    @request = FriendRequest.new
  end

  def create
    @invitee = User.find(params[:user_id])
    @request = FriendRequest.new(inviter_id: current_user.id, invitee_id: @invitee.id)
  end

  private

  def request_params
    params.require(:friend_request).permit(:current_user, :invitee)
  end
end