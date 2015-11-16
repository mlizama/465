json.array!(@tags) do |tag|
  json.extract! tag, :id, :image_id, :str
  json.url tag_url(tag, format: :json)
end
