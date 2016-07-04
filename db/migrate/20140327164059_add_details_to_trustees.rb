class AddDetailsToTrustees < ActiveRecord::Migration
  def change
  	remove_column :trustees, :successor_trustee_1
  	remove_column :trustees, :successor_trustee_2
  	remove_column :trustees, :successor_trustee_3

  	add_column :trustees, :single_successor_trustee, :string
  	add_column :trustees, :co_trustee_5, :string
  	add_column :trustees, :second_successor_trustee, :string
  	add_column :trustees, :third_successor_trustee, :string
  	add_column :trustees, :fourth_successor_trustee, :string
  	add_column :trustees, :fifth_successor_trustee, :string

  end
end
