class AddStatusToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :status, :integer, :default => 0
  end
end
