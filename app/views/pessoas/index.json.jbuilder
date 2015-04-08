json.array!(@pessoas) do |pessoa|
  json.extract! pessoa, :id, :nome, :cpf, :nome_da_mae, :rg, :cor, :identidade_de_genero
  json.url pessoa_url(pessoa, format: :json)
end
