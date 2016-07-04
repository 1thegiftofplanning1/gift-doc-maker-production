class ChangeSpecificGiftsRemoveLimit < ActiveRecord::Migration
  def change
    change_column :people, :specific_gift_to_partner, :text, :limit => nil
    change_column :people, :specific_gift_to_spouse, :text, :limit => nil
  end
end
