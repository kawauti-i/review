class Post < ApplicationRecord
  belongs_to :user
  
  mount_uploader :img, ImgUploader
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
  
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
  def iine(post)
    likes.create(post_id: post.id)
  end
  
  def uniine(post)
    likes.find_by(post_id: post.id).destroy
  end
  
  def iine?(post)
    self.liked_posts.include?(post)
  end
end
