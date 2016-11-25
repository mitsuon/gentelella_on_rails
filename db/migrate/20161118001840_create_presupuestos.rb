class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos do |t|
      t.integer :monto
      t.integer :semestre
      t.integer :anio

      t.timestamps null: false
    end
  end
end
