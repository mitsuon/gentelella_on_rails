class SolicitarSeccion < ActiveRecord::Base
    belongs_to :usuario
    belongs_to :seccion
end
