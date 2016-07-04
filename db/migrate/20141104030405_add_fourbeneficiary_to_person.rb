class AddFourbeneficiaryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :fourbeneficiary, :string
  end
end
