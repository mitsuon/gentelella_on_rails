class CreateEspejos < ActiveRecord::Migration
  def change
    create_table :espejos do |t|
      t.references :mirror, index: true, foreign_key: true
      t.references :reflector, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
