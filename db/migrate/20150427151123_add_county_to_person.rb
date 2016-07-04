class AddCountyToPerson < ActiveRecord::Migration
  def change
    add_column :people, :county, :string
  end
end
