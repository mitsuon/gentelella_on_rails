class ModulosController < ApplicationController
  before_action :set_modulo, only: [:show, :edit, :update, :destroy, :editar_espejo, :eliminar_espejo]
  before_action :set_espejo, only: [:agregar_espejo, :eliminar_espejo]
  
  before_action :validate_usuario
  
  # GET /modulos
  # GET /modulos.json
  def index
    @modulos = Modulo.all
  end

  # GET /modulos/1
  # GET /modulos/1.json
  def show
   
  end

  # GET /modulos/new
  def new
    @modulo = Modulo.new
  end

  # GET /modulos/1/edit
  def edit
  end
  
  
  def editar_espejo
    @modulos = Modulo.all
  end
  
  def agregar_espejo
    @modulo = Modulo.find(params[:id])
    @espejo = Modulo.find(params[:espejo])
    
    
    espejo1 = Espejo.new(:mirror_id => @modulo.id, :reflector_id => @espejo.id)
    espejo2 = Espejo.new(:mirror_id => @espejo.id, :reflector_id => @modulo.id)
    
    if (espejo1.save && espejo2.save)
       flash[:success] = 'Espejo agregado exitosamente'
      redirect_to editar_espejo_modulos_path(@modulo.id)
    end

  end

def eliminar_espejo
    @modulo = Modulo.find(params[:id])
    @espejo = Modulo.find(params[:espejo])
    
    espejo1 = Espejo.where(:mirror_id => @modulo.id, :reflector_id => @espejo.id)
    espejo2 = Espejo.where(:mirror_id => @espejo.id, :reflector_id => @modulo.id)
    
   # espejo1 = espejo1.destroy
    #espejo2 = espejo2.destroy
    
    if (espejo1.destroy_all && espejo2.destroy_all)
       flash[:success] = 'Espejo eliminado exitosamente'
      redirect_to editar_espejo_modulos_path(@modulo.id)
    else
       flash[:warning] = 'Error al eliminar espejo'
    end
  end
  



  # POST /modulos
  # POST /modulos.json
  def create
    @modulo = Modulo.new(modulo_params)
    @malla = Malla.all()
    respond_to do |format|
      if @modulo.save
        format.html { redirect_to @modulo, notice: 'Modulo creado exitosamente.' }
        format.json { render :show, status: :created, location: @modulo }
      else
        format.html { render :new }
        format.json { render json: @modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modulos/1
  # PATCH/PUT /modulos/1.json
  def update
    respond_to do |format|
      if @modulo.update(modulo_params)
        format.html { redirect_to @modulo, notice: 'Modulo actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @modulo }
      else
        format.html { render :edit }
        format.json { render json: @modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modulos/1
  # DELETE /modulos/1.json
  def destroy
    @modulo.malla_id = nil
    @modulo.save
    @modulo.destroy
    respond_to do |format|
      format.html { redirect_to modulos_url, notice: 'Modulo eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modulo
      @modulo = Modulo.find(params[:id])
    end
    
    def set_espejo
      @espejo = Modulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modulo_params
      params.require(:modulo).permit(:nombre, :codigo, :creditos, :nivel, :malla_id, :espejo)
    end

end
