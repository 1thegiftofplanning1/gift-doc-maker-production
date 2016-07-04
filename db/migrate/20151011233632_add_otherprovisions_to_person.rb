class AddOtherprovisionsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :otherprovisions, :string
  end
end
