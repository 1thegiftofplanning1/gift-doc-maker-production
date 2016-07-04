class CreateTrustees < ActiveRecord::Migration
  def change
    create_table :trustees do |t|
      t.integer :person_id
      t.boolean :spouse_co_trustee
      t.string :successor_trustee_1
      t.string :successor_trustee_2
      t.string :successor_trustee_3
      t.boolean :trustee_as_guardian
      t.string :other_guardian
      t.string :co_trustee_1
      t.string :co_trustee_2
      t.string :co_trustee_3
      t.string :co_trustee_4
      t.string :co_trustee_6
      t.string :bank_trustee
      t.boolean :pay_trustee
      t.string :pay_per_hour
      t.string :flat_fee
      t.string :percentage
      t.string :additional_successor_trustee_method
      t.string :percentage_of_beneficiaries_add_trustee
      t.string :person_to_choose_additional_trustees
      t.string :remove_trustee_method
      t.string :percentage_of_beneficiaries_remove_trustee


      t.timestamps
    end
  end
end
