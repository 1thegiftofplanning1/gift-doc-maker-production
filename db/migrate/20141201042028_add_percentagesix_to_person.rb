class AddPercentagesixToPerson < ActiveRecord::Migration
  def change
    add_column :people, :percentagesix, :string
  end
end
