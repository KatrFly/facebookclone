class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # skip_before_action :authenticate_user!, only: [:new, :create]

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'invitee_id', dependent: :destroy
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'inviter_id', dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def all_friends
    a = []
    self.friends.each do |friend|
      a << friend
    end

    other_friends = Friendship.find_by(friend_id: self.id)
      unless other_friends == nil
        begin
          other_friends.take.each do |friendship|
            a << friend
          end
        rescue
          a << other_friends.user
        end
      end
    a
  end

  def friends_include_user?(current_user, friend_id)
    friend_ids = []

    current_user.all_friends.each do |f|
      friend_ids << f.id
    end

    friend_ids
    friend_id
    return true if friend_ids.include?(friend_id) 
  end
end
