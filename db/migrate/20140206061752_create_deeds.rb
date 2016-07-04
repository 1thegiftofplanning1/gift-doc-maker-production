class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|
      t.integer :person_id
      t.string :name_1
      t.string :name_2
      t.string :post_names_phrase
      t.string :deed_kind

      t.timestamps
    end
  end
end
