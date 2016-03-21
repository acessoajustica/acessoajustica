json.array!(@atendimentos) do |atendimento|
  json.extract! atendimento, :id, :status, :cliente_id
  json.url atendimento_url(atendimento, format: :json)
end
