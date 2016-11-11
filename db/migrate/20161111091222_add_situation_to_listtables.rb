class AddSituationToListtables < ActiveRecord::Migration
  def change
    add_column :listtables, :situation, :integer, :default => 0
  end
end
