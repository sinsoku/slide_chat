json.array!(@slides) do |slide|
  json.extract! slide, :id, :url
  json.url slide_url(slide, format: :json)
end
