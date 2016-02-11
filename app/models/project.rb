class Project < ActiveRecord::Base
  extend FriendlyId

  has_many :environments
  has_many :settings, through: :environments

  friendly_id :name, use: :slugged
end
