class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :post_tag_relations, dependent: :delete_all
  has_many :replies, foreign_key: :reply_comment, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 1000 }


  attachment :image

  def self.search(search)
    return Post.all unless search
    Post.where(['title LIKE  ?', "%#{search}%"])
  end
end
