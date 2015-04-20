json.array!(@membros) do |membro|
  json.extract! membro, :id, :ano_faculdade
  json.url membro_url(membro, format: :json)
end
