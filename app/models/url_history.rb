class UrlHistory < ActiveRecord::Base
  belongs_to :url
  belongs_to :crawler_session
  belongs_to :screenshot
end
