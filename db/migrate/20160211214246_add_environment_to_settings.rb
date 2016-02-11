class AddEnvironmentToSettings < ActiveRecord::Migration
  def change
    add_reference :settings, :environment, index: true, foreign_key: true
  end
end
