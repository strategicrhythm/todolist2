class AddApproverToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :approver, :string
  end
end
