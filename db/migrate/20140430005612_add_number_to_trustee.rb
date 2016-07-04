class AddNumberToTrustee < ActiveRecord::Migration
  def change
    add_column :trustees, :number, :string
  end
end
