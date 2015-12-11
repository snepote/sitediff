json.array!(@url_histories) do |url_history|
  json.extract! url_history, :id, :url_id, :crawler_session_id, :screenshot_id, :diff_to_previous
  json.url url_history_url(url_history, format: :json)
end
