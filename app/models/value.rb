class Value < ActiveRecord::Base
  belongs_to :setting
  belongs_to :environment
end
