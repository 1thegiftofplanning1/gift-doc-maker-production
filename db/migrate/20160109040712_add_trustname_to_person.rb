class AddTrustnameToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trustname, :string
  end
end
