class UrlHistory < ActiveRecord::Base
  belongs_to :crawler_session
end
