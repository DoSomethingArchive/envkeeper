class Setting < ActiveRecord::Base
  belongs_to :project
  has_many :environments, through: :values

  validates :name, presence: true
  validates :project_id, presence: true
end
