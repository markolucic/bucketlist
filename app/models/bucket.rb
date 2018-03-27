class Bucket < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :user_likes

  validates :name, presence: true
  validates :image_url, presence: true

  def like!
    update_attribute(:likes, self.likes += 1)
  end

  def dislike!
    update_attribute(:likes, self.likes -= 1)
  end

  def is_my_bucket?(user)
    return true if self.users.include? user
    false
  end
end
