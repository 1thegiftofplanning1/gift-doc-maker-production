class AddLumporseriesToPerson < ActiveRecord::Migration
  def change
    add_column :people, :lumporseries, :string
  end
end
