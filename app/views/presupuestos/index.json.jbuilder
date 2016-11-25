json.array!(@presupuestos) do |presupuesto|
  json.extract! presupuesto, :id, :monto, :semestre, :anio
  json.url presupuesto_url(presupuesto, format: :json)
end
