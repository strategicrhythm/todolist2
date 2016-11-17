class Todolist < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  has_many :listtables,      dependent: :destroy
  accepts_nested_attributes_for :listtables, allow_destroy: true
  enum situation: { uncheck: 0, check: 1 }
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :approver, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  enum status: { unapprove: 0, approve: 1, back: 2}
end
