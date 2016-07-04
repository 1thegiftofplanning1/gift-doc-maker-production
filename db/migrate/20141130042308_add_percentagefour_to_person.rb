class AddPercentagefourToPerson < ActiveRecord::Migration
  def change
    add_column :people, :percentagefour, :string
  end
end
