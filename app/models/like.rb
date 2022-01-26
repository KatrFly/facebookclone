class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.check_if_like_already_exists(likes, current_user_id)
    # likes van de post zoeken
    # user id van de current user
    # staat deze user id al tussen de user_id's van de likes?
    user_ids = []

    likes.each do |like|
      user_ids << like.user_id
    end

    p user_ids
    p current_user_id

    user_ids.include?(current_user_id)
  end
end
