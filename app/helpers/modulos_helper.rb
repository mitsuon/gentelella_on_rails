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
    
    def contains_asignacion(profesor, seccion,semestre,anio)
       if(ProfesorDictaSeccion.where(:profesor_id => profesor.id, :semestre => semestre, :seccion_id => seccion.id , :anio => anio).count > 0)
         return true
       end 
       return false
    end
    
end
