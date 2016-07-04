class AddFormIdToModels < ActiveRecord::Migration
  def change
  	add_column :beneficaries, :form_id, :string
  	add_column :deeds, :form_id, :string
  	add_column :charities, :form_id, :string
  	add_column :trustees, :form_id, :string
  end
end
