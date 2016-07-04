class AddBeneficiarynumberToPerson < ActiveRecord::Migration
  def change
    add_column :people, :beneficiarynumber, :string
  end
end
