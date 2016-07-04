class AddMaskToPeople < ActiveRecord::Migration
  def change
    add_column :people, :mask, :string
  end
end
