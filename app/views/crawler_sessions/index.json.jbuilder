json.array!(@crawler_sessions) do |crawler_session|
  json.extract! crawler_session, :id, :start_time, :end_time
  json.url crawler_session_url(crawler_session, format: :json)
end
