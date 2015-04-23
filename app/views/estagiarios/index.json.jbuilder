json.array!(@estagiarios) do |estagiario|
  json.extract! estagiario, :id, :especialidade
  json.url estagiario_url(estagiario, format: :json)
end
