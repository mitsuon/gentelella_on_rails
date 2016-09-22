class CreateCompletos < ActiveRecord::Migration
  def change
    create_table :completos do |t|
      t.float :numHrs
      t.float :hrsDocencia

      t.timestamps null: false
    end
  end
end
