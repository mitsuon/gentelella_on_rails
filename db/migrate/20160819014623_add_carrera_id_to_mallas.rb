class AddCarreraIdToMallas < ActiveRecord::Migration
  def change
    add_column :mallas, :carrera_id, :integer
  end
end
