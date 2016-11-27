module ProfesorsHelper
    
    def calcularTotalHrs(secciones)
          totalHoras = 0
          @secciones.each do |seccion| 
             totalHoras = totalHoras + seccion.hrsCatedra + seccion.hrsLab
          end
          return totalHoras
    end
    
    def calcularMonto(totalHoras,precioHora, semestre)
        total=0
        if semestre == 1
            total = totalHoras*precioHora*16
        elsif semestre ==2
            total = totalHoras*precioHora*16
        elsif semestre ==3
            total = totalHoras*precioHora*8
        else
            total = totalHoras*precioHora*2
        end
        return total
    end
    
    
    
end
