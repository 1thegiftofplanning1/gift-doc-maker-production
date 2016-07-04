class ChangeJointTrustTypeInPeople < ActiveRecord::Migration
  def change
  	change_column :people, :joint_trust, :string
  	change_column :people, :joint_trust_with_partners, :string
  end
end
