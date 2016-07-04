ActiveAdmin.register Beneficary do
  permit_params  :person_id, :name, :relationship, :under_18,
                 :percentage_of_assets, :specific_gifts,
                 :distribute_lump_sum, :distribute_over_time,
                 :give_at_death, :age_lump_sum, :age_first_distribution,
                 :percent_first_distribution, :preceeding_death_distribution
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/documents/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end