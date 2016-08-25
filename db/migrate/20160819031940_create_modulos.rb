class CreateModulos < ActiveRecord::Migration
  def change
    create_table :modulos do |t|
      t.text :nombre
      t.string :codigo
      t.integer :creditos
      t.integer :nivel

      t.timestamps null: false
    end
  end
end
