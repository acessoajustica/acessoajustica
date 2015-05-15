json.array!(@relatos) do |relato|
  json.extract! relato, :id, :description, :caso_id
  json.url relato_url(relato, format: :json)
end
