class CreateSolicitarSeccions < ActiveRecord::Migration
  def change
    create_table :solicitar_seccions do |t|
      t.string :estado
      t.integer :anio
      t.integer :semestre
      t.belongs_to :usuario, index: true, foreign_key: true
      t.belongs_to :seccion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
