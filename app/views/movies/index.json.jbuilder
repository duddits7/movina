json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :title_original, :description, :prod_date, :post_date, :mpaa_id, :genres
  json.url movie_url(movie, format: :json)
end
