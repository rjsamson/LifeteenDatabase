json.array!(@date_event_types) do |date_event_type|
  json.extract! date_event_type, 
  json.url date_event_type_url(date_event_type, format: :json)
end
