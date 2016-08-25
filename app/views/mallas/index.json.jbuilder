json.array!(@mallas) do |malla|
  json.extract! malla, :id, :plan
  json.url malla_url(malla, format: :json)
end
