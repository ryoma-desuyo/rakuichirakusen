class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 1000 }
end
