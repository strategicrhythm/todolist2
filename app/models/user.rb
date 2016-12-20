class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :todolists
  
  has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  
  has_many :follower_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower
  
  has_many :qalists
  has_many :qalist_commnets, through: :qalists,  source: :comment
  
  has_many :comments
  has_many :commented_qalists, through: :comments, source: :qalist
  
  has_many :answered_comments, class_name:  "Comment", foreign_key: "qalist_id", dependent:   :destroy
  has_many :commented_qalists, through: :answered_comments, source: :qalist
  
  # 他のユーザーをフォローする
  def follow(other_user)
    following_relationships.find_or_create_by(followed_id: other_user.id)
  end

  # フォローしているユーザーをアンフォローする
  def unfollow(other_user)
    following_relationship = following_relationships.find_by(followed_id: other_user.id)
    following_relationship.destroy if following_relationship
  end

  # あるユーザーをフォローしているかどうか？
  def following?(other_user)
    following_users.include?(other_user)
  end
  
  def feed_items
    Todolist.where(user_id: following_user_ids + [self.id])
  end
  
  def latest_items
    Todolist.where(user_id: self.id)
  end
  
  def latest_qalists
    Qalist.where(user_id: self.id)
  end
  
  def feed_qalists
    Qalist.where(user_id: following_user_ids + [self.id])
  end
  
  def answered_comments
    Qalist.where(qalist_id: self.id)
  end
  
  
end
