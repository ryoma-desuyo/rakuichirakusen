class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 1000 }

  attachment :image

  def self.search(search)
    return Post.all unless search
    Post.where(['title LIKE  ?', "%#{search}%"])
  end
end
