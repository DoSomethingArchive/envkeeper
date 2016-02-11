class Setting < ActiveRecord::Base
  belongs_to :environment

  validates :name, presence: true
  validates :environment_id, presence: true
end
