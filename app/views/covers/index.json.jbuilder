json.array!(@covers) do |cover|
  json.extract! cover, :id, :path
  json.url cover_url(cover, format: :json)
end
