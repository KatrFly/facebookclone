class AddReferencesToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :friendrequests, :inviter
    add_foreign_key :friendrequests, :users
  end
end
