class AddTitleToListtables < ActiveRecord::Migration
  def change
    add_column :listtables, :title, :string
  end
end
