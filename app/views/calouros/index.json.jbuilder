json.array!(@calouros) do |calouro|
  json.extract! calouro, :id
  json.url calouro_url(calouro, format: :json)
end
