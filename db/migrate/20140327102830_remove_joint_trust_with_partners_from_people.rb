class RemoveJointTrustWithPartnersFromPeople < ActiveRecord::Migration
  def change
  	remove_column :people, :joint_trust_with_partners
  end
end
