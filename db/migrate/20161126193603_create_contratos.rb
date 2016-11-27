class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.integer :anio
      t.integer :semestre
      t.integer :monto
      t.string :texto
      t.belongs_to :profesor, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
