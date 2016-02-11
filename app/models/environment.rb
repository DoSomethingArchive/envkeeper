class Environment < ActiveRecord::Base
  belongs_to :project
  validates :project_id, presence: true
  validates :name, presence: true
end
