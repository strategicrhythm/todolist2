class AddSituationToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :situation, :integer, :default => 0
  end
end
