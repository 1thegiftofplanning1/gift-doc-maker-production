class AddThreebeneficiaryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :threebeneficiary, :string
  end
end
