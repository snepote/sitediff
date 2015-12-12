# sitediff
Sitemap screenshots comparison site

*Dependencies*
- Redis

*How to install it*
- Checkout the project
- Install Redis _brew install redis_ in OSX)
- _bundle install --without production_ (on dev, of course)
- Run migrations: _bundle exec rake db:migrate_
- Install Python
- Install pip (_sudo easy_install pip_)
- Install requests (_sudo pip install requests_)
- Install pandas (sudo pip install requests)
- Install selenium (_sudo pip install selenium_)

*How to use it*
- Start Redis: _sudo redis-server /usr/local/etc/redis.conf_
- Start sidekiq worker: _bundle exec sidekiq_
- Start a webserver: _rails server_
- Open: http://localhost:3000

# To Do:
- Plot a graph with the history of the differences of a single page
- GA integration to compare CR of a page with the changes
- -sidekick for site crawler and image processing-
- improve image processing algorithm to detect false positive
- parametrise source (currently DE sitemap)
- other type of requests, other than GET
- allow to walk a path of URLs with parameters
- lots of tests
- go to sleep
