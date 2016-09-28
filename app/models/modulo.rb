class Modulo < ActiveRecord::Base
    belongs_to :malla, dependent: :delete
    has_many :seccion
    validates :codigo, :uniqueness => { message: " %{value} ya existe" }
end
