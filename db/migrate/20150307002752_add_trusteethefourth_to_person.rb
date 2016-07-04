class AddTrusteethefourthToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteethefourth, :string
  end
end
