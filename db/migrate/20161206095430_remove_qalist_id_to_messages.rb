class RemoveQalistIdToMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :qalist_id, :integer
  end
end
