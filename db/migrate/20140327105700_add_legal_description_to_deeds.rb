class AddLegalDescriptionToDeeds < ActiveRecord::Migration
  def change
  	add_column :deeds, :legal_description, :string
  	add_column :deeds, :ready_to_enter_info, :string
  end
end
