class AddPartnerDetailsToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :partner_name, :string
  	add_column :people, :all_to_partner, :boolean
    add_column :people, :percent_to_partner, :string
    add_column :people, :specific_gift_to_partner, :string
    add_column :people, :joint_trust_with_partners, :boolean
  end
end
