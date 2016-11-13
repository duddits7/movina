json.array!(@rubrics) do |rubric|
  json.extract! rubric, :id, :name
  json.url rubric_url(rubric, format: :json)
end
