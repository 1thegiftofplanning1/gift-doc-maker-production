class AddTrusteetheoneToPerson < ActiveRecord::Migration
  def change
    add_column :people, :trusteetheone, :string
  end
end
