class ProfesorDictaSeccion < ActiveRecord::Base
    belongs_to :profesor
    belongs_to :seccion
end
