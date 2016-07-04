class ChangePeople < ActiveRecord::Migration
  def change
    change_column :people, :specific_gift_to_partner, :text
    change_column :people, :specific_gift_to_spouse, :text
  end
end
