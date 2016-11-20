class AddApproverToListtables < ActiveRecord::Migration
  def change
    add_column :listtables, :status, :integer, :default => 0
  end
end
