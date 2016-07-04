class AddSevenbeneficiaryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :sevenbeneficiary, :string
  end
end
