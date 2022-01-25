class FriendRequestsController < ApplicationController
  def new
    @request = FriendRequest.new
  end

  def create
    @invitee = User.find(request_params[:invitee_id])
    @request = FriendRequest.new(inviter_id: current_user.id, invitee_id: @invitee.id)
  end

  private

  def request_params
    params.permit(:current_user, :invitee_id)
  end
end