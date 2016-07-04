class AddTrusteethefifthToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteethefifth, :string
  end
end
