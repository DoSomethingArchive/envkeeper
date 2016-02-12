class Value < ActiveRecord::Base
  belongs_to :setting
  belongs_to :environment

  has_paper_trail
end
