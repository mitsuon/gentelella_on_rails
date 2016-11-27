class ContratosController < ApplicationController

  def visualizar
      @contrato = Contrato.find(params[:id])
      puts "#{@contrato.texto}"
    respond_to do |format|
      
      format.pdf {render template: 'contratos/reporte.pdf.erb', pdf: 'Contrato'}
    end
  end
  
  
end


