class AddToDoNowToCharities < ActiveRecord::Migration
  def change
  	add_column :charities, :to_do_now, :string
  end
end
