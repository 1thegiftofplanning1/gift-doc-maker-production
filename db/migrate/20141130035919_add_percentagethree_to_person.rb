class AddPercentagethreeToPerson < ActiveRecord::Migration
  def change
    add_column :people, :percentagethree, :string
  end
end
