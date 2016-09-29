module SeccionsHelper
    
    def get_modulo(seccion)
      if seccion.modulo != nil
          valor = seccion.modulo.nombre 
      else
          valor = "Sin módulo asociado"
      end
    end   
    
    def get_plan(seccion)
      if seccion.modulo != nil
          if seccion.modulo.malla.respond_to?(:plan)
              valor = seccion.modulo.malla.plan
          else
              valor = "Sin plan asociado"
          end
      else
          "Sin plan asociado"
      end
    end  
    
    def get_carrera(seccion)
      if seccion.modulo != nil && seccion.modulo.malla!= nil
          if seccion.modulo.malla.carrera.respond_to?(:nombre)
              valor = seccion.modulo.malla.carrera.nombre
          else
              valor = "Sin carrera asociada1"
          end
      else
          "Sin carrera asociada2"
      end
    end  
    
    
end
