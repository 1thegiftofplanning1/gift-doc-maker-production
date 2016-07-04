class AddPackageToPerson < ActiveRecord::Migration
  def change
    add_column :people, :package, :string
  end
end
