json.array!(@membros) do |membro|
  json.extract! membro, :id, :ano_facultade
  json.url membro_url(membro, format: :json)
end
