class AddCurrentdateToPerson < ActiveRecord::Migration
  def change
    add_column :people, :currentdate, :string
  end
end
