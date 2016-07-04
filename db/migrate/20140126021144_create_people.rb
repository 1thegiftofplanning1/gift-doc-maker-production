class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :listed_state
      t.string :email
      t.string :streetaddress
      t.string :streetaddress2
      t.string :city
      t.string :state
      t.string :postal
      t.string :country
      t.string :marital_status
      t.string :spouse_name

      t.timestamps
    end
  end
end
