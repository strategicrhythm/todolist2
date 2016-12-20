class AddAnswerIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :answer_id, :integer
    add_column :comments, :answer_td_id, :integer
  end
end
