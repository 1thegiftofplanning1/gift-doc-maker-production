class AddBeneficiaryoneToPerson < ActiveRecord::Migration
  def change
    add_column :people, :beneficiaryone, :string
  end
end
