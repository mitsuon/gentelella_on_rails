class CreateProfesorDictaSeccions < ActiveRecord::Migration
  def change
    create_table :profesor_dicta_seccions do |t|
    
      t.integer :anio
      t.integer :semestre
      t.belongs_to :profesor, index: true, foreign_key: true
      t.belongs_to :seccion, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
