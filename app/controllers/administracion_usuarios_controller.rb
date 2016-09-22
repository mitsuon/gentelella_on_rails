class AdministracionUsuariosController < ApplicationController
  before_action :set_user, only: [:activar, :bloquear, :destroy]
  
  def index
    @usuarios = Usuario.all
  end

  def activar
    @usuario.activo = true
    if @usuario.save
      redirect_to( :action => 'index')
      flash[:success ] = "Usuario activado exitosamente"
    else
      redirect_to(:action => 'index')
    end
  end
  
  def bloquear
    @usuario.activo = false
    if @usuario.save
      redirect_to( :action => 'index')
      flash[:warning ] = "Usuario bloqueado exitosamente"

    else
      redirect_to(:action => 'index')
    end
  end
  
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to administracion_usuarios_index_path, notice: 'Usuario Eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @usuario = Usuario.find(params[:id])
  end



end
