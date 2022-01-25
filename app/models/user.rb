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

end
