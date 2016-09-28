class CreateSeccions < ActiveRecord::Migration
  def change
    create_table :seccions do |t|
      t.belongs_to :modulo, index: true, foreign_key: true
      t.string :nombre
      t.integer :hrsLab
      t.integer :hrsCatedra

      t.timestamps null: false
    end
  end
end
