class AddAvatarToTodolists < ActiveRecord::Migration
  def self.up
    add_attachment :todolists, :avatar
  end

  def self.down
    remove_attachment :todolists, :avatar
  end
end
