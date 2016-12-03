class AddTitleToQalists < ActiveRecord::Migration
  def change
    add_column :qalists, :title, :text
    add_column :qalists, :answer, :string
  end
end
