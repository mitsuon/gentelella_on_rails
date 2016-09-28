json.array!(@seccions) do |seccion|
  json.extract! seccion, :id, :modulo_id, :nombre, :hrsLab, :hrsCatedra
  json.url seccion_url(seccion, format: :json)
end
