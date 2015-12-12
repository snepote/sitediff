5.times do |n|
  CrawlerSession.create!(
      start_time: Time.zone.now,
      end_time: Time.zone.now + 1.hour
  )
end

5.times do |i|
  UrlHistory.create!(
      crawler_session_id: i + 1,
      url: 'http://www.helpling.de',
      image_path: 'tapir.png',
      diff_to_previous: 0
  )
  UrlHistory.create!(
      crawler_session_id: i + 1,
      url: 'http://www.helpling.nl',
      image_path: 'tapir_hat.png',
      diff_to_previous: 0
  )
end




