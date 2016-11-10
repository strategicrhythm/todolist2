class AddTitleToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :title, :string
  end
end
