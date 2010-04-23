require 'ruby-debug'

require 'memcache'
conf={
    :compression => false,
    :debug => false,
    :namespace => "20x200",
    :readonly => false,
    :urlencode => false
}
pool=['127.0.0.1:11211']
CACHE=MemCache.new(pool,conf)
CACHE.get('booyah')

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false
config.action_controller.session = {
    :key        => '_images_session',
    :secret     => '1b520a13caf6fba595cf06198c3f2158489f59e0652821ea81d633749838a682',
    :cache      => CACHE,
    :expire     => 600
}
config.action_controller.session_store = :mem_cache_store

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

API_IMAGE="/api/images"
