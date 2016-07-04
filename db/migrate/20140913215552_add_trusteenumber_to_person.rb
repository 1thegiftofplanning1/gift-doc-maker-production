class AddTrusteenumberToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteenumber, :string
  end
end
