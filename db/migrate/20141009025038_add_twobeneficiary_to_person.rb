class AddTwobeneficiaryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :twobeneficiary, :string
  end
end
