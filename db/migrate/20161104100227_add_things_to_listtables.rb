class AddThingsToListtables < ActiveRecord::Migration
  def change
    add_column :listtables, :things, :string
  end
end
