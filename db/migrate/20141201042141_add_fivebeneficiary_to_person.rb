class AddFivebeneficiaryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :fivebeneficiary, :string
  end
end
