class Seccion < ActiveRecord::Base
  belongs_to :modulo
  has_many :solicitar_seccions
  has_many :usuarios, :through => :solicitar_seccions
  has_many :profesor_dicta_seccions
  has_many :profesors, :through => :profesor_dicta_seccions
  validates :nombre, uniqueness: { scope: :modulo_id, message: " %{value} ya existe en módulo" }

end
