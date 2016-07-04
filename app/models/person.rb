class Person < ActiveRecord::Base
  has_paper_trail
  has_many :beneficaries
  has_many :charities
  has_one :deed
  has_one :trustee
  accepts_nested_attributes_for :beneficaries

def married?
  # returns true if person is married, false else wise
  self.marital_status == "I am married."
end

def single?
  # returns true if person is single, false else wise
  self.marital_status == "I am single."
end

def domestic_partnership?
  if !single? && !married? && self.marital_status != nil
    return true
  else
    return false
  end
end


def trust?
  # returns true if package is trust, false else wise
  self.package == "Trust Package"
end

def will?
  # returns true if package is will, false else wise
  self.package == "Will Package"
end

def co2_3?
  # returns true if co2_3 is yes, false else wise
  self.co2_3 == "Yes"
end




def male?
  # returns true if person is male, false else wise
  self.gender == "Male"
end

def female?
  # returns true if person is female, false else wise
  self.gender == "Female"
end

def oregon?
  self.listed_state == "Oregon"
end

def california?
  self.listed_state == "California"
end

end
