class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.integer :person_id
      t.string :name
      t.string :streetaddress
      t.string :streetaddress2
      t.string :city
      t.string :state
      t.string :postal
      t.string :country
      t.string :phone
      t.string :percentage_of_estate
      t.string :other_gift
      t.timestamps
    end
  end
end
