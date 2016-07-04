ActiveAdmin.register Trustee do

  permit_params :spouse_co_trustee,:trustee_as_guardian,:other_guardian,:co_trustee_1,:co_trustee_2,:co_trustee_3,:co_trustee_4,:co_trustee_5,:co_trustee_6,:bank_trustee,:pay_trustee,:pay_per_hour,:flat_fee,:percentage,:additional_successor_trustee_method,:percentage_of_beneficiaries_add_trustee,:person_to_choose_additional_trustees,:remove_trustee_method,:percentage_of_beneficiaries_remove_trustee,:single_successor_trustee,:second_successor_trustee,:third_successor_trustee,:fourth_successor_trustee,:fifth_successor_trustee, :number, :trusteename
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
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
