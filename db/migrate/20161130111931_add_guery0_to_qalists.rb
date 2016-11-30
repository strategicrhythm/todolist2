class AddGuery0ToQalists < ActiveRecord::Migration
  def change
    add_column :qalists, :query0, :text
    add_column :qalists, :line0, :string
    add_column :qalists, :tdnumber0, :integer, :default => 0
    add_column :qalists, :query1, :text
    add_column :qalists, :line1, :string
    add_column :qalists, :tdnumber1, :integer, :default => 1
    add_column :qalists, :query2, :text
    add_column :qalists, :line2, :string
    add_column :qalists, :tdnumber2, :integer, :default => 2
    add_column :qalists, :query3, :text
    add_column :qalists, :line3, :string
    add_column :qalists, :tdnumber3, :integer, :default => 3
    add_column :qalists, :query4, :text
    add_column :qalists, :line4, :string
    add_column :qalists, :tdnumber4, :integer, :default => 4
    add_column :qalists, :query5, :text
    add_column :qalists, :line5, :string
    add_column :qalists, :tdnumber5, :integer, :default => 5
    add_column :qalists, :query6, :text
    add_column :qalists, :line6, :string
    add_column :qalists, :tdnumber6, :integer, :default => 6
    add_column :qalists, :query7, :text
    add_column :qalists, :line7, :string
    add_column :qalists, :tdnumber7, :integer, :default => 7
    add_column :qalists, :query8, :text
    add_column :qalists, :line8, :string
    add_column :qalists, :tdnumber8, :integer, :default => 8
    add_column :qalists, :query9, :text
    add_column :qalists, :line9, :string
    add_column :qalists, :tdnumber9, :integer, :default => 9
  end
end
