json.array!(@ministries) do |ministry|
  json.extract! ministry, 
  json.url ministry_url(ministry, format: :json)
end
