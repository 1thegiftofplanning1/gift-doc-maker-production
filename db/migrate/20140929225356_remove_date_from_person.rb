class RemoveDateFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :date, :string
  end
end
