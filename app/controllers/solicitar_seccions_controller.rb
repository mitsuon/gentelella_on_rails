class SolicitarSeccionsController < ApplicationController
  before_action :get_solicitud, only: [:aceptar, :rechazar , :destroy]
  
  def create
      objeto=params[:solicitar_seccion]
      #anio = objeto.ani
      
      Rails.logger.debug("xxxxxxx solicitar_seccion: #{params[:solicitar_seccion].inspect}")
      Rails.logger.debug("xxxxxxx anio: #{params[:solicitar_seccion][:anio].inspect}")
      Rails.logger.debug("xxxxxxx semestre: #{params[:solicitar_seccion][:semestre].inspect}")
      #Rails.logger.debug("xxxxxxxDDD My object: #{.inspect}")
      
      Rails.logger.debug("xxxxxxx seccionId: #{params[:solicitar_seccion][:seccionId].inspect}")
      
      solicitud = SolicitarSeccion.new(:anio => params[:solicitar_seccion][:anio], :semestre => params[:solicitar_seccion][:semestre],
      :seccion_id => params[:solicitar_seccion][:seccionId], :usuario_id => current_usuario.id, :estado => "enviada" )
      
      if solicitud.save
        flash[:success] = 'Sección solicitada exitosamente'
      else
        flash[:success] = 'Error al intentar crear la solicitud'
      end
      #puts YAML::dump(params)
      
      redirect_to(:action => 'index')
     
  end
    
  def index
    if current_usuario.tipo == "Administrador"
      @solicitudes = SolicitarSeccion.all
      @secciones = Seccion.all
    else
      @solicitudes = SolicitarSeccion.where(:usuario_id => current_usuario.id)
      @secciones = Seccion.all

    end
  end

  def aceptar
    @solicitud.estado = "Aceptada"
    if @solicitud.save
      redirect_to( :action => 'index')
      flash[:success ] = "Solicitud aceptada exitosamente"
    else
      redirect_to(:action => 'index')
    end
  end
  
  def rechazar
    @solicitud.estado = "Rechazada"
    if @solicitud.save
      redirect_to( :action => 'index')
      flash[:success ] = "Solicitud rechazada exitosamente"
    else
      redirect_to(:action => 'index')
    end
  end  
  
  def destroy
    @solicitud.destroy
    respond_to do |format|
      format.html { redirect_to solicitar_seccions_path}
            flash[:success ] = "Solicitud eliminada exitosamente"

      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def get_solicitud
    @solicitud = SolicitarSeccion.find(params[:id])
  end  
    
end
