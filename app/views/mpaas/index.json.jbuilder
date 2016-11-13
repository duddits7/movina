json.array!(@mpaas) do |mpaa|
  json.extract! mpaa, :id, :name
  json.url mpaa_url(mpaa, format: :json)
end
