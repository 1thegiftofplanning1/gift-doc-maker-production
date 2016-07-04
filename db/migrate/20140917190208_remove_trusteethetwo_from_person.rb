class RemoveTrusteethetwoFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :trusteethetwo, :string
  end
end
