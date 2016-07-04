class AddSixbeneficiaryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :sixbeneficiary, :string
  end
end
