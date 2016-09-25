class CreateProfesors < ActiveRecord::Migration
  def change
    create_table :profesors do |t|
      t.string :nombre
      t.string :email
      t.string :rut
      t.string :telefono
      t.string :tipo
      t.integer :precioHora
      t.float :numHrs
      t.float :hrsDocencia

      t.timestamps null: false
    end
  end
end
