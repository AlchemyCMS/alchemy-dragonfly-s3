require "dragonfly/s3_data_store"

# AlchemyCMS Dragonfly configuration.
#
# Consider using some kind of caching solution for image processing.
# For small projects, we have good experience with Rack::Cache.
#
# Larger installations should consider using a CDN, start reading
# http://markevans.github.io/dragonfly/cache/
#
# A complete reference can be found at
# http://markevans.github.io/dragonfly/configuration/
#
# Pictures
#
Dragonfly.app(:alchemy_pictures).configure do
  dragonfly_url nil
  plugin :imagemagick
  plugin :svg
  secret "bcbcc0d97479e5a0a4eb3f9e725f986923b826a268a51ccae918a3c4d4c7340f"
  url_format "/pictures/:job/:name.:ext"

  datastore :s3,
    bucket_name: "test-bucket",
    access_key_id: "XXXXXXXXX",
    secret_access_key: "XXXXXXXXX",
    region: "eu-west-1"
end

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware, :alchemy_pictures

# Attachments
Dragonfly.app(:alchemy_attachments).configure do
  datastore :file,
    root_path: Rails.root.join("uploads/attachments").to_s,
    store_meta: false
end
