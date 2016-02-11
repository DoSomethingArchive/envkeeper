class Environment < ActiveRecord::Base
  belongs_to :project

  validates :project_id, presence: true
  validates :name, presence: true

  before_create do
    self.uuid = SecureRandom.uuid
  end
end
