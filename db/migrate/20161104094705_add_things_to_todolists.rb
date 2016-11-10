class AddThingsToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :things, :string
  end
end
