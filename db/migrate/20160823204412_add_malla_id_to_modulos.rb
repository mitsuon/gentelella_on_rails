class AddMallaIdToModulos < ActiveRecord::Migration
  def change
    add_column :modulos, :malla_id, :integer
  end
end
