class Malla < ActiveRecord::Base
    belongs_to :carrera, dependent: :delete
    has_many :modulos
    validates :plan, uniqueness: { scope: :carrera_id, message: " %{value} ya existe" }
    accepts_nested_attributes_for :modulos

end
