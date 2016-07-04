class AddOnebeneficiaryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :onebeneficiary, :string
  end
end
