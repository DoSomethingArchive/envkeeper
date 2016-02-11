class Setting < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true
  validates :project_id, presence: true
end
