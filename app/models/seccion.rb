class Seccion < ActiveRecord::Base
  belongs_to :modulo
  validates :nombre, uniqueness: { scope: :modulo_id, message: " %{value} ya existe en módulo" }

end
