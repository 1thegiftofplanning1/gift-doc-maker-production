class AddTrusteethefirstToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteethefirst, :string
  end
end
