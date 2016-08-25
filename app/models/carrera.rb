class Carrera < ActiveRecord::Base
    has_many :mallas
    validates :nombre, :uniqueness => { message: "ya existe" }
    
    accepts_nested_attributes_for :mallas
end
