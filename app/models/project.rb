class Project < ActiveRecord::Base
  extend FriendlyId

  has_many :environments
  has_many :settings

  friendly_id :name, use: :slugged
end
