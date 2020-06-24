[![Build Status](https://travis-ci.com/AlchemyCMS/alchemy-dragonfly-s3.svg?branch=master)](https://travis-ci.com/AlchemyCMS/alchemy-dragonfly-s3)

# AlchemyCMS AWS S3

Provides a `Alchemy::Picture.url_class` and `Alchemy::PictureThumb.generator_class` for Alchemy pictures stored on Amazon AWS S3.

## Alchemy Version

This branch works with Alchemy 5.1 only.

- For a Alchemy 4 compatible version use the `alchemy-4` branch.
- For a Alchemy 3 compatible version use the `alchemy-3` branch.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alchemy-dragonfly-s3', github: 'AlchemyCMS/alchemy-dragonfly-s3'
```

For now you also need a special AlchemyCMS branch

```ruby
gem 'alchemy_cms', github: 'tvdeyen/alchemy_cms', branch: 'remote-images'
```

And then execute:

```
$ bundle install
```

Install the picture thumbs migration from Alchemy 5.1

```
$ bin/rake alchemy:install:migrations
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
