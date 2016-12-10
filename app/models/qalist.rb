class Qalist < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :answer, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  has_many :comments, foreign_key: "qalist_id", dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
end
