class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
