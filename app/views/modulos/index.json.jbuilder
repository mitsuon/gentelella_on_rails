json.array!(@modulos) do |modulo|
  json.extract! modulo, :id, :nombre, :codigo, :creditos, :nivel
  json.url modulo_url(modulo, format: :json)
end
