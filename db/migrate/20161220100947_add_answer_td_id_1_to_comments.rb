class AddAnswerTdId1ToComments < ActiveRecord::Migration
  def change
    add_column :comments, :answer_td_id_1, :integer
    add_column :comments, :answer_td_id_2, :integer
    add_column :comments, :answer_td_id_3, :integer
    add_column :comments, :answer_td_id_4, :integer
    add_column :comments, :answer_td_id_5, :integer
    add_column :comments, :answer_td_id_6, :integer
    add_column :comments, :answer_td_id_7, :integer
    add_column :comments, :answer_td_id_8, :integer
    add_column :comments, :answer_td_id_9, :integer
  end
end
