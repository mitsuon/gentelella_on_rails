class AddUniqueIndexToMalla < ActiveRecord::Migration
  def change
    add_index :mallas, [:plan, :carrera_id], unique: true
  end
end
