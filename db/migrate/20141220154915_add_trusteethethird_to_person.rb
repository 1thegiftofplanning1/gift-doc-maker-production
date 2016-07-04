class AddTrusteethethirdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteethethird, :string
  end
end
