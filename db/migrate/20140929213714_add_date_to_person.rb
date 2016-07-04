class AddDateToPerson < ActiveRecord::Migration
  def change
    add_column :people, :date, :string
  end
end
