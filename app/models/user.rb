class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # skip_before_action :authenticate_user!, only: [:new, :create]

  has_many :posts
  has_many :likes
  has_many :comments
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'invitee_id'
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'inviter_id'

  has_many :friendships
  has_many :friends, through: :friendships

  def friends_include_user?(current_user, friend_id)
    current_user.friends.each do |f|
      friend_ids << f.id
    end

    return true if friend_ids.include?(friend_id) 
  end

end
