class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_usuario!



    #redirect to root if the user doesnt belong to administrator or its blocked
    def validate_usuario
      if current_usuario.tipo!='Administrador' || !current_usuario.activo
        redirect_to root_path
      end
    end
end
