class Listtable < ActiveRecord::Base
  belongs_to :todolist
  enum situation: { uncheck: 0, check: 1 }
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  enum status: { unapprove: 0, approve: 1, back: 2}
end
