class CreateBeneficaries < ActiveRecord::Migration
  def change
    create_table :beneficaries do |t|
      t.integer :person_id
      t.string :name
      t.string :relationship
      t.boolean :under_18
      t.string :percentage_of_assets
      t.text :specific_gifts
      t.boolean :distribute_lump_sum
      t.boolean :distribute_over_time
      t.boolean :give_at_death
      t.string :age_lump_sum
      t.string :age_first_distribution
      t.string :percent_first_distribution
      t.string :preceeding_death_distribution

      t.timestamps
    end
  end
end
