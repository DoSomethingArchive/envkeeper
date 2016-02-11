class AddProjectToSettings < ActiveRecord::Migration
  def change
    add_reference :settings, :project, index: true, foreign_key: true
  end
end
