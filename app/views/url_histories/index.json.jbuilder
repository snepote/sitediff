json.array!(@url_histories) do |url_history|
  json.extract! url_history, :id, :crawler_session_id, :url, :image_path, :diff_to_previous
  json.url url_history_url(url_history, format: :json)
end
