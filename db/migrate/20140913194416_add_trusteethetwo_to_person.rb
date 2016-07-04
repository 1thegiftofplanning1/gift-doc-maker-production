class AddTrusteethetwoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteethetwo, :string
  end
end
