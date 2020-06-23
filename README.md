[![Build Status](https://travis-ci.com/AlchemyCMS/alchemy-dragonfly-s3.svg?branch=alchemy-3)](https://travis-ci.com/AlchemyCMS/alchemy-dragonfly-s3)

# AlchemyCMS AWS S3

Adds support for rendered Alchemy thumbnails stored on Amazon AWS S3.

## Alchemy Version

This branch works with Alchemy 3.6 only.

- For a Alchemy 5 compatible version use the `master` branch.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alchemy-dragonfly-s3', github: 'AlchemyCMS/alchemy-dragonfly-s3', branch: 'alchemy-3'
```

And then execute:

```
$ bundle install
```

Install the picture thumbs migration

```
$ bin/rake alchemy_dragonfly_s3:install:migrations
$ bin/rake db:migrate
```

## Setup

Configure a S3 datastore for Dragonfly

```ruby
# config/initializers/dragonfly

require "dragonfly/s3_data_store"

...

Dragonfly.app(:alchemy_pictures).configure do
  plugin :imagemagick
  plugin :svg

  datastore :s3,
    bucket_name: ENV.fetch("ALCHEMY_S3_BUCKET_NAME"),
    access_key_id: ENV.fetch("ALCHEMY_S3_ACCESS_KEY_ID"),
    secret_access_key: ENV.fetch("ALCHEMY_S3_SECRET_ACCESS_KEY"),
    region: ENV.fetch("ALCHEMY_S3_REGION")
end

...
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
