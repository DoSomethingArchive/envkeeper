class Setting < ActiveRecord::Base
  belongs_to :project
  has_many :values
  has_many :environments, through: :values

  accepts_nested_attributes_for :values

  validates :name, presence: true
  validates :project_id, presence: true
end
