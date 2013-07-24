json.array!(@date_events) do |date_event|
  json.extract! date_event, 
  json.url date_event_url(date_event, format: :json)
end
