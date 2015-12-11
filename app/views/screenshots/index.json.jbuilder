json.array!(@screenshots) do |screenshot|
  json.extract! screenshot, :id, :file_path
  json.url screenshot_url(screenshot, format: :json)
end
