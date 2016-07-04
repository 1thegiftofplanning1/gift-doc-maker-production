class AddFirstDetailsToBeneficaries < ActiveRecord::Migration
  def change
  	add_column :beneficaries, :gender, :string
  	add_column :beneficaries, :guardian, :string
  	add_column :beneficaries, :co_guardians, :string
  	add_column :beneficaries, :successor_guardian, :string
  	add_column :beneficaries, :spouse, :string
  	add_column :beneficaries, :partner, :string
  	add_column :beneficaries, :significant_other, :string
  	add_column :beneficaries, :single, :boolean
  	add_column :beneficaries, :age_second_distribution, :string
  	add_column :beneficaries, :percent_second_distribution, :string
  	add_column :beneficaries, :age_third_distribution, :string
  	add_column :beneficaries, :another_beneficiary, :boolean
  end
end
