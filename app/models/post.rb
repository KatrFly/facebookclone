class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def like_already_exists?(current_user_id)
    # likes van de post zoeken
    # user id van de current user
    # staat deze user id al tussen de user_id's van de likes?
    user_ids = []

    unless self.likes.nil?
      self.likes.each do |like|
        user_ids << like.user_id
      end

      p user_ids
      p current_user_id

      return Like.find_by(user_id: current_user_id) if user_ids.include?(current_user_id)
      false
    end
  end
end
