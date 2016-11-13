json.array!(@genres) do |genre|
  json.id genre.id.to_s
  json.text genre.name
  json.selected genre.selected
end
