class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :qalist, index: true, foreign_key: true
      t.timestamps null: false
      t.index [:user_id, :created_at]
      t.index [:qalist_id, :created_at]
  end
  end
end
