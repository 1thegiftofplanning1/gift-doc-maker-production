class RemoveFormIdFromDeedsAndTrustees < ActiveRecord::Migration
  def change
  	remove_column :deeds, :form_id
  	remove_column :trustees, :form_id
  end
end
