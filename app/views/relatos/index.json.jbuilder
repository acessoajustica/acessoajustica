json.array!(@relatos) do |relato|
  json.extract! relato, :id, :description, :atendimento_id
  json.url relato_url(relato, format: :json)
end
