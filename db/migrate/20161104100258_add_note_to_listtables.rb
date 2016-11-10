class AddNoteToListtables < ActiveRecord::Migration
  def change
    add_column :listtables, :note, :string
  end
end
