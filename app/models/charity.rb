class Charity < ActiveRecord::Base
  belongs_to :person
  has_paper_trail
end
