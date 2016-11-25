class Modulo < ActiveRecord::Base
    belongs_to :malla, dependent: :delete
    has_many :seccion
    has_many :yo_mirror, :class_name => 'Espejo', :foreign_key => 'mirror_id'
    has_many :yo_reflector, :class_name => 'Espejo', :foreign_key => 'reflector_id'
    validates :codigo, :uniqueness => { message: " %{value} ya existe" }
end
