class AddAvatarToListtables < ActiveRecord::Migration
  def self.up
    add_attachment :listtables, :avatar
  end

  def self.down
    remove_attachment :listtables, :avatar
  end
end
