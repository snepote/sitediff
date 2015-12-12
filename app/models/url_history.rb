require 'fileutils'

class UrlHistory < ActiveRecord::Base
  belongs_to :crawler_session

  # Save URLs
  def self.save_urls(urls, crawler_session_id, timestamp)
    image_base_path = Rails.root.join( 'app', 'assets', 'images', 'screenshots', timestamp )
    FileUtils::mkdir_p image_base_path

    urls = ['https://www.helpling.com.sg', 'https://www.helpling.com.sg/helplings', 'https://www.helpling.com.sg/cleaners']

    urls.uniq!
    urls.each do |url|
      filename = url.clone
      replacements = [ ["https://www.", ""], ["/", ""] ]
      replacements.each {|replacement| filename.gsub!(replacement[0], replacement[1])}
      filename = "#{filename}.png"
      exec_cmd = "python #{Rails.root.join('bin', 'keep_grabbing_single_url.py')} #{image_base_path} #{filename} #{url}"

      @url_history = UrlHistory.new(
          crawler_session_id: crawler_session_id,
          url: url,
          image_path: "#{timestamp}/#{filename}"
      )
      @url_history.save

      system(exec_cmd)
    end
  end

  private

  def get_image_name(url)
    replacements = [ ["https://www.", ""], ["/", ""] ]
    replacements.each {|replacement| url.gsub!(replacement[0], replacement[1])}
    url
  end
end
