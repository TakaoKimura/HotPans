json.array!(@bread_stores) do |bread_store|
  json.extract! bread_store, :name, :phone_number, :address
  json.url bread_store_url(bread_store, format: :json)
end
