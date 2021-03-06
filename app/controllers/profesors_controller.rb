class ProfesorsController < ApplicationController
  before_action :set_profesor, only: [:show, :edit, :update, :destroy]

  # GET /profesors
  # GET /profesors.json
  def index
    @profesors = Profesor.all
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
