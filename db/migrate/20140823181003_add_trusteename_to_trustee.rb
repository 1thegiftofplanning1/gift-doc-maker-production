class AddTrusteenameToTrustee < ActiveRecord::Migration
  def change
    add_column :trustees, :trusteename, :string
  end
end
