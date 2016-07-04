class AddTrusteethesecondToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteethesecond, :string
  end
end
