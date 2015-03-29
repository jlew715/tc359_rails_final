json.array!(@electronics_stores) do |electronics_store|
  json.extract! electronics_store, :id, :name, :main_address, :phone, :website, :email, :number_of_locations, :sells_tablets, :sells_phones
  json.url electronics_store_url(electronics_store, format: :json)
end
