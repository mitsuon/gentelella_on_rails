class Modulo < ActiveRecord::Base
    belongs_to :malla, dependent: :delete
    validates :codigo, :uniqueness => { message: " %{value} ya existe" }
end
