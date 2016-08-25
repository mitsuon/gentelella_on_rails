json.array!(@carreras) do |carrera|
  json.extract! carrera, :id, :nombre
  json.url carrera_url(carrera, format: :json)
end
