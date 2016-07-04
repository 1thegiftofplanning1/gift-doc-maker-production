module ApplicationHelper


  def pull_wufoo(email)
    pull_person_from_wufoo(email)
    pull_beneficary_from_wufoo(email)
    pull_deed_from_wufoo(email)
  end
  def pull_person_from_wufoo(email)
    @account = 'dyingtoplan'
    @api_key = '02W4-BJYE-9X7N-HXJA'
    wufoo = WuParty.new(@account, @api_key)
    form_id = 'x1ivr1a91f45yd6'
      entry = wufoo.form(form_id).entries(filters:[['Field3381','Is_equal_to',email]]).last
    if entry!=nil
      @person = Person.new
      @person = Person.where(:email => entry["Field3381"]).first if Person.where(:email => entry["Field3381"]).count != 0
      @person.name = entry["Field3"]
      @person.email = entry["Field3381"]
      @person.streetaddress = entry["Field3120"]
      @person.streetaddress2 = entry["Field3121"]
      @person.city = entry["Field3122"]
      @person.state = entry["Field3123"]
      @person.postal = entry["Field3124"]
      @person.country = entry["Field3125"]
      @person.marital_status = entry["Field3110"]
      @person.mask = Digest::MD5.hexdigest("9b3a1fb75fe185e077202de53039f300cd49d398"+@person.email)
      @person.save!
    end

    form_id = 'p139mmbo1qfx7kn'
      entry = wufoo.form(form_id).entries(filters:[['Field116','Is_equal_to',email]]).last
    if entry!=nil
      @person = Person.where(:email => entry["Field116"]).last
      @person.agent = entry["Field1"]
      @person.agent = entry["Field7"] if entry["Field7"] != ""
      if entry["Field112"] == "Yes."
        @person.alternate_agent = entry["Field5"]
        @person.alternate_agent = entry["Field9"] if entry["Field9"] != ""
      end
      @person.save!
    end
  end
  def pull_beneficary_from_wufoo(email)
    @account = 'dyingtoplan'
    @api_key = '02W4-BJYE-9X7N-HXJA'
    wufoo = WuParty.new(@account, @api_key)
    form_id = 'zpiu3510nd9bjz' # first Beneficiary
      entry = wufoo.form(form_id).entries(filters:[['Field923','Is_equal_to',email]]).last
      @beneficiary = Beneficary.new
    if entry != nil
      @beneficiary.person_id = Person.where(:email => entry["Field923"]).last.id
      @beneficiary.name = entry["Field122"]
      @beneficiary.relationship = entry["Field594"]
      @beneficiary.under_18 = false
      @beneficiary.under_18 = true unless entry["Field812"] == ""
      @beneficiary.save!
    end
  end
  def pull_deed_from_wufoo(email)
    @account = 'dyingtoplan'
    @api_key = '02W4-BJYE-9X7N-HXJA'
    wufoo = WuParty.new(@account, @api_key)
    form_id = 's15r9p040pzo71w'
    entry = wufoo.form(form_id).entries(filters:[['Field8','Is_equal_to',email]]).last
      @deed = Deed.new
    if entry != nil
      @deed.person = Person.where(:email => entry["Field8"]).last
      @deed.name_1 = entry["Field1"]
      @deed.name_2 = entry["Field2"]
      @deed.post_names_phrase = entry["Field4"]
      @deed.deed_kind= entry["Field6"]
      @deed.save!
      end

  end
  def pull_all_from_wufoo
    @account = 'dyingtoplan'
    @api_key = '02W4-BJYE-9X7N-HXJA'
    wufoo = WuParty.new(@account, @api_key)
    form_id = 'x1ivr1a91f45yd6'
    entry_count = wufoo.get("forms/#{form_id}/entries/count").parsed_response["EntryCount"].to_i
    last_page = (entry_count +(25- entry_count % 25))/25 - 1
    emails = Set.new
    (0..last_page).each do |p|
      wufoo.form(form_id).entries(:pageStart=> p*25).each do |entry|
        emails.add entry["Field3381"]
      end
    end
    emails.delete?("")
    emails.each do |email|
      pull_wufoo(email)
    end
  end
end
