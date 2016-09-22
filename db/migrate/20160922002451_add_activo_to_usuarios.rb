class AddActivoToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :activo, :boolean, default: false
  end
end
