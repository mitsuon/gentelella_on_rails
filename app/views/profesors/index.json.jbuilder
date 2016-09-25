json.array!(@profesors) do |profesor|
  json.extract! profesor, :id, :nombre, :email, :rut, :telefono, :tipo, :precioHora, :numHrs, :hrsDocencia
  json.url profesor_url(profesor, format: :json)
end
