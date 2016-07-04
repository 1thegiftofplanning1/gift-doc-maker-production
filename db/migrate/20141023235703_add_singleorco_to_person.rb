class AddSingleorcoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :singleorco, :string
  end
end
