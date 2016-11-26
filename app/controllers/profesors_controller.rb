class ProfesorsController < ApplicationController
  before_action :set_profesor, only: [:show, :edit, :update, :destroy]

  # GET /profesors
  # GET /profesors.json
  def index
    @profesors = Profesor.all
  end
  
  def honorario
    @profesors = Profesor.where(:tipo => "Honorario")
    @solicitud = SolicitarSeccion.new
  end

  def tiempo_completo
    @profesors = Profesor.where(:tipo => "Completo")
    @solicitud = SolicitarSeccion.new

  end

  # GET /profesors/1
  # GET /profesors/1.json
  def show
  end

  # GET /profesors/new
  def new
    @profesor = Profesor.new
    @valor = 'Completo'
  end
  
  def new1
    @profesor = Profesor.new
    @valor = 'Honorario'
  end

  # GET /profesors/1/edit
  def edit
  end

  # POST /profesors
  # POST /profesors.json
  def create
    @profesor = Profesor.new(profesor_params)
    
    # if params[:tipo] =='Completo'
    #       @profesor.tipo = 'Completo'
    #       flash[:warning ] = "Completo"
    # end
    
    # if params[:tipo]=='Honorario'
    #   @profesor.tipo = 'Honorario'
    #   flash[:warning ] = "Honorario"
    # else
    #   flash[:warning ] = "EERROR POR LA CTM"
    # end


    respond_to do |format|
      if @profesor.save
        flash[:success] = 'Profesor creado exitosamente'
        format.html { redirect_to @profesor }
        format.json { render :show, status: :created, location: @profesor }
      else
        format.html { render :new }
        format.json { render json: @profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesors/1
  # PATCH/PUT /profesors/1.json
  def update
    respond_to do |format|
      if @profesor.update(profesor_params)
        flash[:success] = 'Profesor actualizado exitosamente'
        format.html { redirect_to @profesor }
        format.json { render :show, status: :ok, location: @profesor }
      else
        flash[:error] = @profesor.errors.full_messages
        format.html { render :edit }
        format.json { render json: @profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesors/1
  # DELETE /profesors/1.json
  def destroy
    @profesor.destroy
    respond_to do |format|
      flash[:success] = 'Profesor eliminado exitosamente'
      format.html { redirect_to profesors_url }
      format.json { head :no_content }
    end
  end
  
   #GET 'visualizar_honorario/profesor/:profesor_id/semestre/:semestre/anio/:anio'
   def visualizar_honorario
     @profesor = Profesor.find(params[:profesor_id])
     @anio = params[:anio]
     @semestre = params[:semestre]
     
     @secciones= Seccion.find(ProfesorDictaSeccion.where(:profesor_id => @profesor.id, :semestre => @semestre, :anio => @anio).pluck(:seccion_id))
    
   end
  
  
  #GET 'asignar/profesor/:profesor_id/semestre/:semestre/anio/:anio'
  def asignar
    puts params.to_json
    @profesor = Profesor.find(params[:profesor_id])
    @anio = params[:anio]
    @semestre = params[:semestre]
    @secciones = Seccion.all
  end
  
  #POST 'asignar'
  def guardar_asignar
    profesor = Profesor.find(params[:profesor_id])
    profesorDicta = ProfesorDictaSeccion.new(:profesor_id => params[:profesor_id], :semestre => params[:semestre], :seccion_id => params[:seccion_id] , :anio => params[:anio] )

    if(ProfesorDictaSeccion.where(:profesor_id => params[:profesor_id], :semestre => params[:semestre], :seccion_id => params[:seccion] , :anio => params[:anio]).count > 0)
      flash[:warning] = 'Asignación ya realizada'
    else
      flash[:success] = 'Asignación realizada exitosamente'
      ProfesorDictaSeccion.create(:profesor_id => params[:profesor_id], :semestre => params[:semestre], :seccion_id => params[:seccion] , :anio => params[:anio])
    end
    redirect_to asignar_path(:profesor_id => params[:profesor_id], :semestre => params[:semestre] , :anio => params[:anio])
  end
  
  def quitar_asignar
    if(ProfesorDictaSeccion.where(:profesor_id => params[:profesor_id], :semestre => params[:semestre], :seccion_id => params[:seccion] , :anio => params[:anio]).count > 0)
      remover =  ProfesorDictaSeccion.where(:profesor_id => params[:profesor_id], :semestre => params[:semestre], :seccion_id => params[:seccion] , :anio => params[:anio])
      ProfesorDictaSeccion.destroy(remover)
      flash[:success] = 'Asignación removida exitosamente'
    else
      flash[:danger] = 'Error al intentar remover la asignación'
      
    end
    redirect_to asignar_path(:profesor_id => params[:profesor_id], :semestre => params[:semestre] , :anio => params[:anio])
  
  end

  #GET /contrato/profesor/:profesor_id/semestre/:semestre/anio/:anio  profesor_contrato_path
  def contrato
    @profesor = Profesor.find(params[:profesor_id])
    @anio = params[:anio]
    @semestre = params[:semestre]
    @secciones= Seccion.find(ProfesorDictaSeccion.where(:profesor_id => @profesor.id, :semestre => @semestre, :anio => @anio).pluck(:seccion_id))

  end

  
  
   #POST 'visualizar_honorario'
  def guardar_visualizar_honorario
    
  end


  #GET tiempo_completo/asignar/profesor/:profesor_id/semestre/:semestre/anio/:anio'  tiempo_completo_asignar_path
  def tiempo_completo_asignar
    @profesor = Profesor.find(params[:profesor_id])
    @anio = params[:anio]
    @semestre = params[:semestre]
    @secciones = Seccion.all
  end
   
  #GET tiempo_completo/visualizar/profesor/:profesor_id/semestre/:semestre/anio/:anio' tiempo_completo_visualizar_path
  def tiempo_completo_visualizar
     @profesor = Profesor.find(params[:profesor_id])
     @anio = params[:anio]
     @semestre = params[:semestre]
     
     @secciones= Seccion.find(ProfesorDictaSeccion.where(:profesor_id => @profesor.id, :semestre => @semestre, :anio => @anio).pluck(:seccion_id))
  end
  
  #POST tiempo_completo/asignar guardar_tiempo_completo_asignar_path
  def guardar_tiempo_completo_asignar
    
  end
  
  #POST tiempo_completo/visualizar_honorario guardar_tiempo_completo_visualizar_path
  def guardar_tiempo_completo_visualizar
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profesor
      @profesor = Profesor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profesor_params
      params.require(:profesor).permit(:nombre, :email, :rut, :telefono, :tipo, :precioHora, :numHrs, :hrsDocencia)
    end
end
