json.array!(@breads) do |bread|
  json.extract! bread, :name, :kind
  json.url bread_url(bread, format: :json)
end
