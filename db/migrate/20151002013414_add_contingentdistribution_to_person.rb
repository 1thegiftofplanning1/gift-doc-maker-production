class AddContingentdistributionToPerson < ActiveRecord::Migration
  def change
    add_column :people, :contingentdistribution, :string
  end
end
