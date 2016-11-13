class Todolist < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  has_many :listtables,      dependent: :destroy
  accepts_nested_attributes_for :listtables, allow_destroy: true
  enum situation: { uncheck: 0, check: 1 }
end
