class CreateHonorarios < ActiveRecord::Migration
  def change
    create_table :honorarios do |t|
      t.integer :precioHora

      t.timestamps null: false
    end
  end
end
