json.array!(@translations) do |translation|
  json.extract! translation, :id, :name
  json.url translation_url(translation, format: :json)
end
