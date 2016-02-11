class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.references :setting, index: true, foreign_key: true
      t.references :environment, index: true, foreign_key: true
      t.string :data

      t.timestamps null: false
    end
  end
end
