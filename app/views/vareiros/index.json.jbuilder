json.array!(@vareiros) do |vareiro|
  json.extract! vareiro, :id, :forum
  json.url vareiro_url(vareiro, format: :json)
end
