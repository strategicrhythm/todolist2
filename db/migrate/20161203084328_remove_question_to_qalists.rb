class RemoveQuestionToQalists < ActiveRecord::Migration
  def change
    remove_column :qalists, :question1, :text
    remove_column :qalists, :deadline1, :string
    remove_column :qalists, :tdid1, :integer
    remove_column :qalists, :question2, :text
    remove_column :qalists, :deadline2, :string
    remove_column :qalists, :tdid2, :integer
    remove_column :qalists, :question3, :text
    remove_column :qalists, :deadline3, :string
    remove_column :qalists, :tdid3, :integer
    remove_column :qalists, :question4, :text
    remove_column :qalists, :deadline4, :string
    remove_column :qalists, :tdid4, :integer
    remove_column :qalists, :question5, :text
    remove_column :qalists, :deadline5, :string
    remove_column :qalists, :tdid5, :integer
    remove_column :qalists, :question6, :text
    remove_column :qalists, :deadline6, :string
    remove_column :qalists, :tdid6, :integer
    remove_column :qalists, :question7, :text
    remove_column :qalists, :deadline7, :string
    remove_column :qalists, :tdid7, :integer
    remove_column :qalists, :question8, :text
    remove_column :qalists, :deadline8, :string
    remove_column :qalists, :tdid8, :integer
    remove_column :qalists, :question9, :text
    remove_column :qalists, :deadline9, :string
    remove_column :qalists, :tdid9, :integer
    remove_column :qalists, :question10, :text
    remove_column :qalists, :deadline10, :string
    remove_column :qalists, :tdid10, :integer
  end
end
