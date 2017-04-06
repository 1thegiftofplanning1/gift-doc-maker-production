include ApplicationHelper
ActiveAdmin.register Person do

  permit_params :name, :listed_state,:email,:streetaddress,:streetaddress2,:city,:state,:postal,:country,
  :marital_status,:spouse_name,:all_to_spouse,:percent_to_spouse,:specific_gift_to_spouse,:previously_married,
  :give_assets_to_previous_spouse,:assets_for_previous_spouse,:joint_trust,:agent,:alternate_agent,:legal_description_of_property,
  :mask,:partner_name,:all_to_partner,:percent_to_partner,:specific_gift_to_partner,:gender,:trusteetheone, :trusteethesecond, 
  :trusteenumber, :currentdate, :onebeneficiary, :twobeneficiary, :singleorco, :beneficiarynumber, :percentageone, :percentagetwo, 
  :threebeneficiary, :fourbeneficiary, :lumporseries, :percentagethree, :percentagefour, :percentagefive, :percentagesix, :fivebeneficiary, 
  :sixbeneficiary, :trusteethethird, :sevenbeneficiary, :percentageseven, :trusteethefourth, :trusteethefifth, :county, :beneficiaryone, 
  :contingentdistribution, :contingentdescription, :otherprovisions, :trustname, :package, :co2_3, :code

  #form do |f|
  #form do |f|
  #  f.inputs do
  #   f.input :name, :label => "Name"
  #   f.input :email,:label => "Email"
  #   f.input :streetaddress, :label => "Street Address"
  #   f.input :streetaddress2, :label => "Address Line 2"
  #   f.input :city
  #   f.input :state
  #   f.input :country, :as => :country
  #   f.input :marital_status,   :as => :radio, :collection => ["I am married.", "I am in a domestic partnership.", "I am single."]
  #   f.has_many :beneficaries, :allow_destroy => true, :heading => 'Beneficiaries' do |b|
  #     b.input :name
  #   end
 #    end
  #   f.actions
  #end

  index do
    selectable_column
    column :name
    column :email
    #column "Trust" do |person|
    #  link_to "Trust", trust_path(person), class: "member_link"
    #end
    column "Documents" do |person|
      link_to "Documents", document_path(person.mask,:type => "all"), class: "member_link"
    end
    #column "Trust PDF" do |person|
    #  link_to "Trust pdf ", trust_path(person, :format=> :pdf), class: "member_link"
    #end
    column "Documents PDF" do |person|
      link_to "Documents pdf", document_path(person.mask,:type => "all", :format=> :pdf), class: "member_link"
    end
    #
    # https://dyingtoplan.wufoo.com/admin/
    actions do |person|
    end
  end

  collection_action :pull_from_wufoo, :method => :get do
    c = Person.count
    @account = 'dyingtoplan'
    @api_key = '02W4-BJYE-9X7N-HXJA'
    wufoo = WuParty.new(@account, @api_key)

    ######## Person Model ################
    form_id = 'x1ivr1a91f45yd6'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        @person = Person.new
        @person = Person.where(:email => entry["Field3381"]).first if Person.where(:email => entry["Field3381"]).count != 0
        @person.name = entry["Field3"]
        @person.spouse_name = entry["Field3400"]
        @person.trusteetheone = entry["Field3143"]
        @person.trusteethesecond = entry["Field3150"]
        @person.trusteethethird = entry["Field3385"]
        @person.trusteethefourth = entry["Field3515"]
        @person.trusteethefifth = entry["Field3516"]
        @person.trusteenumber = entry["Field3148"]
        @person.singleorco = entry["Field3395"]
        @person.lumporseries = entry["Field3383"]
        @person.currentdate = entry["Field3153"]
        @person.beneficiarynumber = entry["Field3161"]
        @person.onebeneficiary = entry["Field3155"]
        @person.twobeneficiary = entry["Field3157"]
        @person.threebeneficiary = entry["Field3269"]
        @person.fourbeneficiary = entry["Field3272"]
        @person.fivebeneficiary = entry["Field3275"]
        @person.sixbeneficiary = entry["Field3276"]
        @person.sevenbeneficiary = entry["Field3398"]
        @person.otherprovisions = entry["Field3756"]
        @person.contingentdistribution = entry["Field3650"]
        @person.contingentdescription = entry["Field3653"]
        @person.percentageone = entry["Field3625"]
        @person.percentagetwo = entry["Field3655"]
        @person.percentagethree = entry["Field3270"]
        @person.percentagefour = entry["Field3277"]
        @person.percentagefive = entry["Field3378"]
        @person.percentagesix = entry["Field3379"]
        @person.percentageseven = entry["Field3397"]
        @person.email = entry["Field3381"]
        @person.streetaddress = entry["Field3120"]
        @person.streetaddress2 = entry["Field3121"]
        @person.city = entry["Field3122"]
        @person.state = entry["Field3123"]
        @person.postal = entry["Field3124"]
        @person.country = entry["Field3125"]
        @person.county = entry["Field3518"]
        @person.marital_status = entry["Field3110"]
        @person.gender = entry["Field3139"]
        @person.trustname = entry["Field3760"]
        @person.co2_3 = entry["Field3800"]
        @person.code = entry["Field3801"]
        @person.mask = Digest::MD5.hexdigest("9b3a1fb75fe185e077202de53039f300cd49d398"+@person.email)
        @person.save!
      end
    end
    
    
    form_id = 'w7jrs8z0d74q9x'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        @person = Person.new
        @person = Person.where(:email => entry["Field3381"]).first if Person.where(:email => entry["Field3381"]).count != 0
        @person.name = entry["Field3"]
        @person.spouse_name = entry["Field3400"]
        @person.trusteetheone = entry["Field3143"]
        @person.trusteethesecond = entry["Field3150"]
        @person.trusteethethird = entry["Field3385"]
        @person.trusteethefourth = entry["Field3515"]
        @person.trusteethefifth = entry["Field3516"]
        @person.trusteenumber = entry["Field3148"]
        @person.singleorco = entry["Field3395"]
        @person.lumporseries = entry["Field3383"]
        @person.currentdate = entry["Field3153"]
        @person.beneficiarynumber = entry["Field3161"]
        @person.onebeneficiary = entry["Field3155"]
        @person.beneficiaryone = entry["Field122"]
        @person.twobeneficiary = entry["Field3157"]
        @person.threebeneficiary = entry["Field3269"]
        @person.fourbeneficiary = entry["Field3272"]
        @person.fivebeneficiary = entry["Field3275"]
        @person.sixbeneficiary = entry["Field3276"]
        @person.sevenbeneficiary = entry["Field3398"]
        @person.percentageone = entry["Field3263"]
        @person.percentagetwo = entry["Field3758"]
        @person.percentagethree = entry["Field3270"]
        @person.percentagefour = entry["Field3277"]
        @person.percentagefive = entry["Field3378"]
        @person.percentagesix = entry["Field3379"]
        @person.percentageseven = entry["Field3397"]
        @person.email = entry["Field3381"]
        @person.streetaddress = entry["Field3120"]
        @person.streetaddress2 = entry["Field3121"]
        @person.city = entry["Field3122"]
        @person.state = entry["Field3123"]
        @person.postal = entry["Field3124"]
        @person.country = entry["Field3125"]
        @person.county = entry["Field3518"]
        @person.marital_status = entry["Field3110"]
        @person.gender = entry["Field3139"]
        @person.mask = Digest::MD5.hexdigest("9b3a1fb75fe185e077202de53039f300cd49d398"+@person.email)
        @person.save!
      end
    end

    form_id = 'p139mmbo1qfx7kn'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        @person = Person.where(:email => entry["Field116"]).last
        if @person.present?

          if entry["Field7"] != ""
            @person.agent = entry["Field7"]
          elsif entry["Field118"] != ""
            @person.agent = entry["Field118"]
          end
          if entry["Field120"] == "Yes."
            @person.alternate_agent = entry["Field122"]
            @person.alternate_agent = entry["Field9"] if entry["Field9"] != ""
          end
          @person.save!
        end
      end
    end

    form_id = 'r1bz4grz0izset4'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        @person = Person.where(:email => entry["Field141"]).last
        if @person.present?
          @person.spouse_name = entry["Field3400"]
          if entry["Field2"] == "All to spouse."
            @person.all_to_spouse = true
          end
          if entry["Field2"] == "Show me other options."
            @person.all_to_spouse = false
            if entry["Field7"] == "A specific percentage of the estate."
              @person.percent_to_spouse = entry["Field108"]
            end
            if entry["Field8"] == "Specific gifts."
              @person.specific_gift_to_spouse = entry["Field110"]
            end
          end
          if entry["Field112"] == "Yes"
            @person.previously_married = true
            if entry["Field117"] == "Yes"
              @person.give_assets_to_previous_spouse = true
              @person.assets_for_previous_spouse = entry["Field119"]
            end
            if entry["Field117"] == "No"
              @person.give_assets_to_previous_spouse = false
            end
          end
          if entry["Field112"] == "No"
            @person.previously_married = false
          end
          @person.joint_trust = entry["Field121"]
          @person.save!
        end
      end
    end

    form_id = 'q1fn3ioo0y616zi'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        @person = Person.where(:email => entry["Field128"]).last
        if @person.present?
          @person.partner_name = entry["Field1"]
          if entry["Field5"] == "All to partner."
            @person.all_to_partner = true
          end
          if entry["Field5"] == "Show me other options."
            @person.all_to_partner = false
            if entry["Field10"] == "A specific percentage of the trust's assets."
              @person.percent_to_partner = entry["Field111"]
            end
            if entry["Field11"] == "Specific gifts."
              @person.specific_gift_to_partner = entry["Field113"]
            end
          end
          @person.joint_trust = entry["Field117"]
          @person.save!
        end
      end
    end

    ################## Beneficary ################
    form_id = 's1640m9809a9fl1'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field922"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field922", "Is_equal_to", "#{email}"]] ).last
        @beneficiary = Beneficary.new
        @beneficiary = Beneficary.where(:form_id => form_id, :person_id => person.id).first if Beneficary.where(:form_id => form_id, :person_id => person.id).count != 0
        @beneficiary.form_id = form_id
        @beneficiary.name = entry["Field122"]
        @beneficiary.person = person
        @beneficiary.gender = entry["Field920"]
        @beneficiary.relationship = entry["Field594"]
        if entry["Field812"] == "Yes"
          if entry["Field711"] == "Yes"
            @beneficiary.guardian = entry["Field709"]
          end
          if entry["Field712"] == "Yes, but I'd like to name two or more co-guardians."
            @beneficiary.co_guardians = entry["Field915"]
          end
          if entry["Field713"] == "Yes, and I'd also like to name a successor guardian."
            @beneficiary.successor_guardian = entry["Field918"]
          end
        end
        if entry["Field813"] == "No"
          if entry["Field10"] == "married."
            @beneficiary.spouse = entry["Field111"]
          end
          if entry["Field11"] == "in a registered domestic partnership."
            @beneficiary.partner = entry["Field112"]
          end
          if entry["Field12"] == 'in a relationship with a "significant other" that I want to plan for.'
            @beneficiary.significant_other = entry["Field114"]
          end
          if entry["Field113"] == "is single."
            @beneficiary.single = true
          end
        end
        if entry["Field577"] == "A percentage of the trust's assets."
          @beneficiary.percentage_of_assets = entry["Field129"]
        end
        if entry["Field577"] == "One or more specific gifts (this can include a specific sum of money)."
          @beneficiary.specific_gifts = entry["Field585"]
        end
        if entry["Field577"] == "A percentage of the trust's assets PLUS one or more specific gifts (which can include a specific sum of money)."
          @beneficiary.percentage_of_assets = entry["Field589"]
          @beneficiary.specific_gifts = entry["Field601"]
        end
        if entry["Field571"] == "We want some of the gifts to be given after the death of the first of us to die."
          @beneficiary.specific_gifts = entry["Field573"]
        end
        if entry["Field361"] == "In a lump sum."
          @beneficiary.distribute_lump_sum = true
          if entry["Field606"] == "At my death."
            @beneficiary.give_at_death = true
          end
          if entry["Field606"] == "At a certain age."
            @beneficiary.age_lump_sum = entry["Field134"]
          end
        end
        if entry["Field362"] == "In a series of distributions over time."
          @beneficiary.age_first_distribution = entry["Field136"]
          @beneficiary.percent_first_distribution = entry["Field138"]
        end
        @beneficiary.age_second_distribution = entry["Field140"]
        @beneficiary.percent_second_distribution = entry["Field143"]
        if entry["Field258"] == "Yes"
          @beneficiary.age_third_distribution = entry["Field147"]
        end
        @beneficiary.preceeding_death_distribution = entry["Field150"]
        if entry["Field150"] == "To some other person(s) or charity(ies)."
          @beneficiary.preceeding_death_distribution = entry["Field153"]
        end
        if entry["Field154"] == "Yes, I do."
          @beneficiary.another_beneficiary = true
        end
        if entry["Field154"] == "No, I don't."
          @beneficiary.another_beneficiary = false
        end
        @beneficiary.save!
      end
    end

    form_id = 's2q5c3x1yrniev'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field922"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field922", "Is_equal_to", "#{email}"]] ).last
        @beneficiary = Beneficary.new
        @beneficiary = Beneficary.where(:form_id => form_id, :person_id => person.id).first if Beneficary.where(:form_id => form_id, :person_id => person.id).count != 0
        @beneficiary.form_id = form_id
        @beneficiary.name = entry["Field122"]
        @beneficiary.person = person
        @beneficiary.gender = entry["Field920"]
        @beneficiary.relationship = entry["Field594"]
        if entry["Field812"] == "Yes"
          if entry["Field711"] == "Yes"
            @beneficiary.guardian = entry["Field709"]
          end
          if entry["Field712"] == "Yes, but I'd like to name two or more co-guardians."
            @beneficiary.co_guardians = entry["Field915"]
          end
          if entry["Field713"] == "Yes, and I'd also like to name a successor guardian."
            @beneficiary.successor_guardian = entry["Field918"]
          end
        end
        if entry["Field813"] == "No"
          if entry["Field10"] == "married."
            @beneficiary.spouse = entry["Field111"]
          end
          if entry["Field11"] == "in a registered domestic partnership."
            @beneficiary.partner = entry["Field112"]
          end
          if entry["Field12"] == 'in a relationship with a "significant other" that I want to plan for.'
            @beneficiary.significant_other = entry["Field114"]
          end
          if entry["Field113"] == "is single."
            @beneficiary.single = true
          end
        end
        if entry["Field577"] == "A percentage of the trust's assets."
          @beneficiary.percentage_of_assets = entry["Field129"]
        end
        if entry["Field577"] == "One or more specific gifts (this can include a specific sum of money)."
          @beneficiary.specific_gifts = entry["Field585"]
        end
        if entry["Field577"] == "A percentage of the trust's assets PLUS one or more specific gifts (which can include a specific sum of money)."
          @beneficiary.percentage_of_assets = entry["Field589"]
          @beneficiary.specific_gifts = entry["Field601"]
        end
        if entry["Field571"] == "We want some of the gifts to be given after the death of the first of us to die."
          @beneficiary.specific_gifts = entry["Field573"]
        end
        if entry["Field361"] == "In a lump sum."
          @beneficiary.distribute_lump_sum = true
          if entry["Field606"] == "At my death."
            @beneficiary.give_at_death = true
          end
          if entry["Field606"] == "At a certain age."
            @beneficiary.age_lump_sum = entry["Field134"]
          end
        end
        if entry["Field362"] == "In a series of distributions over time."
          @beneficiary.age_first_distribution = entry["Field136"]
          @beneficiary.percent_first_distribution = entry["Field138"]
        end
        @beneficiary.age_second_distribution = entry["Field140"]
        @beneficiary.percent_second_distribution = entry["Field143"]
        if entry["Field258"] == "Yes"
          @beneficiary.age_third_distribution = entry["Field147"]
        end
        @beneficiary.preceeding_death_distribution = entry["Field150"]
        if entry["Field150"] == "To some other person(s) or charity(ies)."
          @beneficiary.preceeding_death_distribution = entry["Field153"]
        end
        if entry["Field154"] == "Yes, I do."
          @beneficiary.another_beneficiary = true
        end
        if entry["Field154"] == "No, I don't."
          @beneficiary.another_beneficiary = false
        end
        @beneficiary.save!
      end
    end

    form_id = 's1y4ct0s1jxs4ng'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field922"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field922", "Is_equal_to", "#{email}"]] ).last
        @beneficiary = Beneficary.new
        @beneficiary = Beneficary.where(:form_id => form_id, :person_id => person.id).first if Beneficary.where(:form_id => form_id, :person_id => person.id).count != 0
        @beneficiary.form_id = form_id
        @beneficiary.name = entry["Field122"]
        @beneficiary.person = person
        @beneficiary.gender = entry["Field920"]
        @beneficiary.relationship = entry["Field594"]
        if entry["Field812"] == "Yes"
          if entry["Field711"] == "Yes"
            @beneficiary.guardian = entry["Field709"]
          end
          if entry["Field712"] == "Yes, but I'd like to name two or more co-guardians."
            @beneficiary.co_guardians = entry["Field915"]
          end
          if entry["Field713"] == "Yes, and I'd also like to name a successor guardian."
            @beneficiary.successor_guardian = entry["Field918"]
          end
        end
        if entry["Field813"] == "No"
          if entry["Field10"] == "married."
            @beneficiary.spouse = entry["Field111"]
          end
          if entry["Field11"] == "in a registered domestic partnership."
            @beneficiary.partner = entry["Field112"]
          end
          if entry["Field12"] == 'in a relationship with a "significant other" that I want to plan for.'
            @beneficiary.significant_other = entry["Field114"]
          end
          if entry["Field113"] == "is single."
            @beneficiary.single = true
          end
        end
        if entry["Field577"] == "A percentage of the trust's assets."
          @beneficiary.percentage_of_assets = entry["Field129"]
        end
        if entry["Field577"] == "One or more specific gifts (this can include a specific sum of money)."
          @beneficiary.specific_gifts = entry["Field585"]
        end
        if entry["Field577"] == "A percentage of the trust's assets PLUS one or more specific gifts (which can include a specific sum of money)."
          @beneficiary.percentage_of_assets = entry["Field589"]
          @beneficiary.specific_gifts = entry["Field601"]
        end
        if entry["Field571"] == "We want some of the gifts to be given after the death of the first of us to die."
          @beneficiary.specific_gifts = entry["Field573"]
        end
        if entry["Field361"] == "In a lump sum."
          @beneficiary.distribute_lump_sum = true
          if entry["Field606"] == "At my death."
            @beneficiary.give_at_death = true
          end
          if entry["Field606"] == "At a certain age."
            @beneficiary.age_lump_sum = entry["Field134"]
          end
        end
        if entry["Field362"] == "In a series of distributions over time."
          @beneficiary.age_first_distribution = entry["Field136"]
          @beneficiary.percent_first_distribution = entry["Field138"]
        end
        @beneficiary.age_second_distribution = entry["Field140"]
        @beneficiary.percent_second_distribution = entry["Field143"]
        if entry["Field258"] == "Yes"
          @beneficiary.age_third_distribution = entry["Field147"]
        end
        @beneficiary.preceeding_death_distribution = entry["Field150"]
        if entry["Field150"] == "To some other person(s) or charity(ies)."
          @beneficiary.preceeding_death_distribution = entry["Field153"]
        end
        if entry["Field154"] == "Yes, I do."
          @beneficiary.another_beneficiary = true
        end
        if entry["Field154"] == "No, I don't."
          @beneficiary.another_beneficiary = false
        end
        @beneficiary.save!
      end
    end

    form_id = 's1fb0o41ssbtnm'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field922"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field922", "Is_equal_to", "#{email}"]] ).last
        @beneficiary = Beneficary.new
        @beneficiary = Beneficary.where(:form_id => form_id, :person_id => person.id).first if Beneficary.where(:form_id => form_id, :person_id => person.id).count != 0
        @beneficiary.form_id = form_id
        @beneficiary.name = entry["Field122"]
        @beneficiary.person = person
        @beneficiary.gender = entry["Field920"]
        @beneficiary.relationship = entry["Field594"]
        if entry["Field812"] == "Yes"
          if entry["Field711"] == "Yes"
            @beneficiary.guardian = entry["Field709"]
          end
          if entry["Field712"] == "Yes, but I'd like to name two or more co-guardians."
            @beneficiary.co_guardians = entry["Field915"]
          end
          if entry["Field713"] == "Yes, and I'd also like to name a successor guardian."
            @beneficiary.successor_guardian = entry["Field918"]
          end
        end
        if entry["Field813"] == "No"
          if entry["Field10"] == "married."
            @beneficiary.spouse = entry["Field111"]
          end
          if entry["Field11"] == "in a registered domestic partnership."
            @beneficiary.partner = entry["Field112"]
          end
          if entry["Field12"] == 'in a relationship with a "significant other" that I want to plan for.'
            @beneficiary.significant_other = entry["Field114"]
          end
          if entry["Field113"] == "is single."
            @beneficiary.single = true
          end
        end
        if entry["Field577"] == "A percentage of the trust's assets."
          @beneficiary.percentage_of_assets = entry["Field129"]
        end
        if entry["Field577"] == "One or more specific gifts (this can include a specific sum of money)."
          @beneficiary.specific_gifts = entry["Field585"]
        end
        if entry["Field577"] == "A percentage of the trust's assets PLUS one or more specific gifts (which can include a specific sum of money)."
          @beneficiary.percentage_of_assets = entry["Field589"]
          @beneficiary.specific_gifts = entry["Field601"]
        end
        if entry["Field571"] == "We want some of the gifts to be given after the death of the first of us to die."
          @beneficiary.specific_gifts = entry["Field573"]
        end
        if entry["Field361"] == "In a lump sum."
          @beneficiary.distribute_lump_sum = true
          if entry["Field606"] == "At my death."
            @beneficiary.give_at_death = true
          end
          if entry["Field606"] == "At a certain age."
            @beneficiary.age_lump_sum = entry["Field134"]
          end
        end
        if entry["Field362"] == "In a series of distributions over time."
          @beneficiary.age_first_distribution = entry["Field136"]
          @beneficiary.percent_first_distribution = entry["Field138"]
        end
        @beneficiary.age_second_distribution = entry["Field140"]
        @beneficiary.percent_second_distribution = entry["Field143"]
        if entry["Field258"] == "Yes"
          @beneficiary.age_third_distribution = entry["Field147"]
        end
        @beneficiary.preceeding_death_distribution = entry["Field150"]
        if entry["Field150"] == "To some other person(s) or charity(ies)."
          @beneficiary.preceeding_death_distribution = entry["Field153"]
        end
        if entry["Field154"] == "Yes, I do."
          @beneficiary.another_beneficiary = true
        end
        if entry["Field154"] == "No, I don't."
          @beneficiary.another_beneficiary = false
        end
        @beneficiary.save!
      end
    end

    form_id = 'zpiu3510nd9bjz'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field923"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field923", "Is_equal_to", "#{email}"]] ).last
        @beneficiary = Beneficary.new
        @beneficiary = Beneficary.where(:form_id => form_id, :person_id => person.id).first if Beneficary.where(:form_id => form_id, :person_id => person.id).count != 0
        @beneficiary.form_id = form_id
        @beneficiary.name = entry["Field122"]
        @beneficiary.person = person
        @beneficiary.gender = entry["Field920"]
        @beneficiary.relationship = entry["Field594"]
        if entry["Field812"] == "Yes"
          if entry["Field711"] == "Yes"
            @beneficiary.guardian = entry["Field709"]
          end
          if entry["Field712"] == "Yes, but I'd like to name two or more co-guardians."
            @beneficiary.co_guardians = entry["Field915"]
          end
          if entry["Field713"] == "Yes, and I'd also like to name a successor guardian."
            @beneficiary.successor_guardian = entry["Field918"]
          end
        end
        if entry["Field813"] == "No"
          if entry["Field10"] == "married."
            @beneficiary.spouse = entry["Field111"]
          end
          if entry["Field11"] == "in a registered domestic partnership."
            @beneficiary.partner = entry["Field112"]
          end
          if entry["Field12"] == 'in a relationship with a "significant other" that I want to plan for.'
            @beneficiary.significant_other = entry["Field114"]
          end
          if entry["Field113"] == "is single."
            @beneficiary.single = true
          end
        end
        if entry["Field577"] == "A percentage of the trust's assets."
          @beneficiary.percentage_of_assets = entry["Field129"]
        end
        if entry["Field577"] == "One or more specific gifts (this can include a specific sum of money)."
          @beneficiary.specific_gifts = entry["Field585"]
        end
        if entry["Field577"] == "A percentage of the trust's assets PLUS one or more specific gifts (which can include a specific sum of money)."
          @beneficiary.percentage_of_assets = entry["Field589"]
          @beneficiary.specific_gifts = entry["Field601"]
        end
        if entry["Field571"] == "We want some of the gifts to be given after the death of the first of us to die."
          @beneficiary.specific_gifts = entry["Field573"]
        end
        if entry["Field361"] == "In a lump sum."
          @beneficiary.distribute_lump_sum = true
          if entry["Field606"] == "At my death."
            @beneficiary.give_at_death = true
          end
          if entry["Field606"] == "At a certain age."
            @beneficiary.age_lump_sum = entry["Field134"]
          end
        end
        if entry["Field362"] == "In a series of distributions over time."
          @beneficiary.age_first_distribution = entry["Field136"]
          @beneficiary.percent_first_distribution = entry["Field138"]
        end
        @beneficiary.age_second_distribution = entry["Field140"]
        @beneficiary.percent_second_distribution = entry["Field143"]
        if entry["Field258"] == "Yes"
          @beneficiary.age_third_distribution = entry["Field147"]
        end
        @beneficiary.preceeding_death_distribution = entry["Field150"]
        if entry["Field150"] == "To some other person(s) or charity(ies)."
          @beneficiary.preceeding_death_distribution = entry["Field153"]
        end
        if entry["Field154"] == "Yes, I do."
          @beneficiary.another_beneficiary = true
        end
        if entry["Field154"] == "No, I don't."
          @beneficiary.another_beneficiary = false
        end
        @beneficiary.save!
      end
    end

    ############ Deeds ###################
    form_id = 's137sil51sgvqms'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field5"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field5", "Is_equal_to", "#{email}"]] ).last
        @deed = Deed.new
        @deed = Deed.where(:person_id => person.id).first if Deed.where(:person_id => person.id).count != 0
        @deed.person = person
        @deed.legal_description = entry["Field1"]
        @deed.ready_to_enter_info = entry["Field3"]
        @deed.save!
      end
    end

    form_id = 's15r9p040pzo71w'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field8"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field8", "Is_equal_to", "#{email}"]] ).last
        @deed = Deed.new
        @deed = Deed.where(:person_id => person.id).first if Deed.where(:person_id => person.id).count != 0
        @deed.person = person
        @deed.name_1 = entry["Field1"]
        @deed.name_2 = entry["Field2"]
        @deed.post_names_phrase = entry["Field4"]
        if entry["Field4"] == "other"
          @deed.post_names_phrase = entry["Field6"]
        end
        @deed.save!
      end
    end

    form_id = 'sei0kmw1jpa9fc'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field5"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field5", "Is_equal_to", "#{email}"]] ).last
        @deed = Deed.new
        @deed = Deed.where(:person_id => person.id).first if Deed.where(:person_id => person.id).count != 0
        @deed.person = person
        @deed.deed_kind = entry["Field1"]
        if entry["Field1"] == "Other"
          @deed.deed_kind = entry["Field3"]
        end
        @deed.save!
      end
    end

    ################### Charities ####################
    form_id = 'q1vs2e2r1ol5g98'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field21"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field21", "Is_equal_to", "#{email}"]] ).last
        @charity = Charity.new
        @charity = Charity.where(:form_id => form_id, :person_id => person.id).first if Charity.where(:form_id => form_id, :person_id => person.id).count != 0
        @charity.person = person
        @charity.form_id = form_id
        @charity.name = entry["Field1"]
        @charity.streetaddress = entry["Field2"]
        @charity.streetaddress2 = entry["Field3"]
        @charity.city = entry["Field4"]
        @charity.state = entry["Field5"]
        @charity.postal = entry["Field6"]
        @charity.country = entry["Field7"]
        @charity.phone = entry["Field8"]
        @charity.percentage_of_estate = entry["Field11"]
        if entry["Field11"] == "Other"
          @charity.percentage_of_estate = entry["Field13"]
        end
        @charity.other_gift = entry["Field14"]
        @charity.save!
      end
    end

    form_id = 'q1mlj6yw1m7qov8'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field130"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field130", "Is_equal_to", "#{email}"]] ).last
        @charity = Charity.new
        @charity = Charity.where(:form_id => form_id, :person_id => person.id).first if Charity.where(:form_id => form_id, :person_id => person.id).count != 0
        @charity.form_id = form_id
        @charity.person = person
        @charity.name = entry["Field1"]
        @charity.streetaddress = entry["Field4"]
        @charity.streetaddress2 = entry["Field5"]
        @charity.city = entry["Field6"]
        @charity.state = entry["Field7"]
        @charity.postal = entry["Field8"]
        @charity.country = entry["Field9"]
        @charity.phone = entry["Field12"]
        @charity.percentage_of_estate = entry["Field16"]
        if entry["Field16"] == "Other"
          @charity.percentage_of_estate = entry["Field24"]
        end
        @charity.other_gift = entry["Field26"]
        @charity.to_do_now = entry["Field128"]
        @charity.save!
      end
    end

    ################## Trustees ###################
    form_id = 'q1ddi6he0auvv79'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field232"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field232", "Is_equal_to", "#{email}"]] ).last
        @trustee = Trustee.new
        @trustee = Trustee.where(:person_id => person.id).first if Trustee.where(:person_id => person.id).count != 0
        @trustee.person = person
        if entry["Field102"] == "No"
          @trustee.pay_trustee = false
        end
        if entry["Field102"] == "Yes"
          @trustee.pay_trustee = true
          if entry["Field104"] == "pay your trustee by the hour?"
            @trustee.pay_per_hour = entry["Field205"]
          end
          if entry["Field105"] = "pay your trustee a flat fee?"
            @trustee.flat_fee = entry["Field207"]
          end
          if entry["Field106"] = "pay your trustee a percentage of the estate?"
            @trustee.percentage = entry["Field208"]
          end
        end
        @trustee.additional_successor_trustee_method = entry["Field212"]
        if entry["Field212"] == "by the beneficiaries of the trust (or guardians of beneficiaries who are minors or otherwise legally incompetent)."
          @trustee.percentage_of_beneficiaries_add_trustee = entry["Field214"]
        end
        if entry["Field212"] == "by a friend, a family member, or a trusted advisor."
          @trustee.person_to_choose_additional_trustees = entry["Field216"]
        end
        @trustee.remove_trustee_method = entry["Field220"]
        if entry["Field220"] == "The beneficiaries (or guardians of beneficiaries who are minors or otherwise legally incompetent)."
          @trustee.percentage_of_beneficiaries_remove_trustee = entry["Field221"]
        end
        if entry["Field220"] == "A friend, a family member, or a trusted advisor."
          @trustee.person_to_choose_additional_trustees = entry["Field222"]
        end
        @trustee.save!
      end
    end

    form_id = 'pkneqt80w2c79h'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field2978"]
      end
    end
    emails.each do |email|
      person = Person.find_by_email(email)
      unless person.nil?
        entry = wufoo.form(form_id).entries(filters: [["Field2978", "Is_equal_to", "#{email}"]] ).last
        @trustee = Trustee.new
        @trustee = Trustee.where(:person_id => person.id).first if Trustee.where(:person_id => person.id).count != 0
        @trustee.person = person
        # @trustee.trusteename = entry["Field3103"]
        @trustee.single_successor_trustee = entry["Field3103"]
        if entry["Field3126"] == "Yes."
          @trustee.spouse_co_trustee = false
        end
        if entry["Field3126"] == "Yes, but I want to serve as co-trustee with my spouse. (This is what most couples do.)"
          @trustee.spouse_co_trustee = true
        end

        if entry["Field3131"] == "A single trustee"

          @trustee.single_successor_trustee = entry["Field3103"]
        end
        if entry["Field3128"] == "Yes."
          @trustee.number = entry["Field3129"]
        end
        if entry["Field3131"] == "Co-trustees"
          @trustee.co_trustee_1 = entry["Field2765"]
          @trustee.co_trustee_2 = entry["Field2767"]
          @trustee.co_trustee_3 = entry["Field2768"]
        end
        if entry["Field2757"] == "Yes. I want the person I've chosen to be my trustee to also be the guardian of any minor beneficiary."
          @trustee.trustee_as_guardian = true
        end
        if entry["Field2757"] == "No. I want to name someone else to be my child's guardian."
          @trustee.trustee_as_guardian = false
          @trustee.other_guardian = entry["Field2758"]
        end
        @trustee.second_successor_trustee = entry["Field3113"]
        if entry["Field2524"] == "Yes"
          if entry["Field1362"] == "Third successor trustee"
            @trustee.third_successor_trustee = entry["Field1352"]
          end
          if entry["Field1363"] == "Fourth successor trustee"
            @trustee.fourth_successor_trustee = entry["Field1353"]
          end
          if entry["Field1364"] == "Fifth successor trustee"
            @trustee.fifth_successor_trustee = entry["Field1354"]
          end
        end
        if entry["Field1144"] == "I think I'll just stick with a single successor trustee."
          @trustee.single_successor_trustee = entry["Field3103"]
        end
        if entry["Field1145"] == "I think I'd like to have co-successor trustees."
          @trustee.co_trustee_1 = entry["Field1680"]
          @trustee.co_trustee_2 = entry["Field1681"]
          @trustee.co_trustee_3 = entry["Field2420"]
        end
        @trustee.co_trustee_4 = entry["Field1794"]
        @trustee.co_trustee_5 = entry["Field1795"]
        @trustee.co_trustee_6 = entry["Field1797"]
        if entry["Field2113"] == "I want to name a bank or trust company."
          @trustee.bank_trustee = entry["Field2110"]
        end
        @trustee.save!
      end
    end

  end

  

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
