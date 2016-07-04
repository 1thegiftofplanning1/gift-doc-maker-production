class AddTrustpackageToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trustpackage, :string
  end
end
