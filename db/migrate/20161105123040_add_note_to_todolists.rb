class AddNoteToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :note, :string
  end
end
