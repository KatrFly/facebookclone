class AddReferencesToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :friend_requests, :inviter_id
    add_reference :friend_requests, :invitee_id
  end
end
