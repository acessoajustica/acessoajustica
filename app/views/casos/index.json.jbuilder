json.array!(@casos) do |caso|
  json.extract! caso, :id, :status
  json.url caso_url(caso, format: :json)
end
