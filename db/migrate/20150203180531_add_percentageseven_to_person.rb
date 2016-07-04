class AddPercentagesevenToPerson < ActiveRecord::Migration
  def change
    add_column :people, :percentageseven, :string
  end
end
