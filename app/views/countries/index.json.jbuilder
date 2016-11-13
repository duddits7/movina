json.array!(@countries) do |country|
  json.id country.id.to_s
  json.text country.name
  json.selected country.selected
end
