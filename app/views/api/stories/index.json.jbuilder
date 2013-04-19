json.page @stories.current_page
json.per_page @stories.limit_value
json.num_pages @stories.num_pages

json.items do
  json.array! @stories do |story|
    json.partial! story
  end
end
