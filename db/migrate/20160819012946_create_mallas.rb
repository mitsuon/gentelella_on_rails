class CreateMallas < ActiveRecord::Migration
  def change
    create_table :mallas do |t|
      t.string :plan

      t.timestamps null: false
    end
  end
end
