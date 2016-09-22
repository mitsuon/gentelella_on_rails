class Profesor < ActiveRecord::Base
    validates :rut, :uniqueness => { message: "ya existe" }
    validates :email, :uniqueness => { message: "ya existe" }

end
