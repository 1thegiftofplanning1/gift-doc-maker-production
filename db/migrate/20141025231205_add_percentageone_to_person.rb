class AddPercentageoneToPerson < ActiveRecord::Migration
  def change
    add_column :people, :percentageone, :string
  end
end
