json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :filhos_quantidade, :profissao_nome, :familia_quantidade, :familia_renda, :contribuintes_quantidade, :estado_civil_id, :moradia_type_id, :profissao_type_id
  json.url cliente_url(cliente, format: :json)
end
