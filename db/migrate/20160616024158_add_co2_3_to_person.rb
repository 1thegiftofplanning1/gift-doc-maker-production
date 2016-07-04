class AddCo23ToPerson < ActiveRecord::Migration
  def change
    add_column :people, :co2_3, :string
  end
end
