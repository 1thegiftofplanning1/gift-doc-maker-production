class AddContingentdescriptionToPerson < ActiveRecord::Migration
  def change
    add_column :people, :contingentdescription, :string
  end
end
