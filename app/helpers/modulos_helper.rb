module ModulosHelper
    def modulo_detail(m)
      if m.malla.respond_to?(:carrera)
          valor = m.nombre << " (" << m.malla.carrera.nombre<< ")"
      else
          valor = m.nombre << " (Sin carrera asociada)"
      end
    end    
end
