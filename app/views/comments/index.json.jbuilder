json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :page_number
  json.url slide_comments_url(@slide, comment, format: :json)
end
