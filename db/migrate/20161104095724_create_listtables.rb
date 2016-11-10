class CreateListtables < ActiveRecord::Migration
  def change
    create_table :listtables do |t|
      t.references :todolist, index: true, foreign_key: true

      t.timestamps null: false
      t.index [:todolist_id, :created_at]
    end
  end
end
