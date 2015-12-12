class CrawlerSession < ActiveRecord::Base
  has_many :url_history
end
