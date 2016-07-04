class AddPercentagetwoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :percentagetwo, :string
  end
end
