class Seccion < ActiveRecord::Base
  belongs_to :modulo
  has_many :solicitar_seccions
  has_many :usuarios, :through => :solicitar_seccions
  validates :nombre, uniqueness: { scope: :modulo_id, message: " %{value} ya existe en módulo" }

end
