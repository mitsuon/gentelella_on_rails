class Profesor < ActiveRecord::Base
    validates :rut, :uniqueness => { message: "  %{value} ya existe" }, :presence => true
    validates :email, :uniqueness => { message: "  %{value} ya existe" }, :presence => true
    #validates :precioHora, :presence => { :message => " no puede ser vacio" },  unless: ->(profesor){profesor.tipo == 'Completo'}
    
  has_many :profesor_dicta_seccions
  has_many :seccions, :through => :profesor_dicta_seccions
  has_many :contratos
    
  def tipo_honorario
    if tipo == 'Honorario' && numHrs.blank?
      errors.add(:numHrs, 'needs to be present if location_id is not present')
    end
  end
  

end
