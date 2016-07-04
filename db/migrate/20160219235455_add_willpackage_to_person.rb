class AddWillpackageToPerson < ActiveRecord::Migration
  def change
    add_column :people, :willpackage, :string
  end
end
