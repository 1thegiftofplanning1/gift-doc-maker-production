class AddPercentagefiveToPerson < ActiveRecord::Migration
  def change
    add_column :people, :percentagefive, :string
  end
end
