class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.string :uuid

      t.timestamps null: false
    end
  end
end
