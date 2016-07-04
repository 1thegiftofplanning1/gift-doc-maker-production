class AddMarriageDetailsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :all_to_spouse, :boolean
    add_column :people, :percent_to_spouse, :string
    add_column :people, :specific_gift_to_spouse, :string
    add_column :people, :previously_married, :boolean
    add_column :people, :give_assets_to_previous_spouse, :boolean
    add_column :people, :assets_for_previous_spouse, :string
    add_column :people, :joint_trust, :boolean
    add_column :people, :agent, :string
    add_column :people, :alternate_agent, :string
    add_column :people, :legal_description_of_property, :string

  end
end
