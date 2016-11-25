module ModulosHelper
    def modulo_detail(m)
      if m.malla.respond_to?(:carrera)
          valor = m.nombre << " (" << m.malla.carrera.nombre<< ")"
      else
          valor = m.nombre << " (Sin carrera asociada)"
      end
    end   
    
    def contains_espejo(yo, modulo)
      yo.yo_mirror.each do |espejo|
        if espejo.reflector_id == modulo.id
          return true
        end
      end
      return false
    end   
    
    
end
