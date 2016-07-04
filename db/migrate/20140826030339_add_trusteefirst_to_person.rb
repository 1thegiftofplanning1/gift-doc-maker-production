class AddTrusteefirstToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteefirst, :string
  end
end
