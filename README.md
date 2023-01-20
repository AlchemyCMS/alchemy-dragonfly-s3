[![Build Status](https://travis-ci.com/AlchemyCMS/alchemy-dragonfly-s3.svg?branch=main)](https://travis-ci.com/AlchemyCMS/alchemy-dragonfly-s3)

# AlchemyCMS AWS S3

Provides classes for storing Alchemy pictures and file attachments on Amazon AWS S3.

## Alchemy Version

This branch works with Alchemy 6.0 and above.

- For a Alchemy 5.2/5.3 compatible version use the `5.2-stable` branch.
- For a Alchemy 5.0 compatible version use the `alchemy-5` branch.
- For a Alchemy 4 compatible version use the `alchemy-4` branch.
- For a Alchemy 3 compatible version use the `alchemy-3` branch.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alchemy-dragonfly-s3', github: 'AlchemyCMS/alchemy-dragonfly-s3'
```

And then execute:

```
$ bundle install
```

## Setup

Configure a S3 datastore for Dragonfly

```ruby
# config/initializers/dragonfly

require "dragonfly/s3_data_store"

Rails.application.credentials.aws.tap do |aws_config|
  Dragonfly.app(:alchemy_pictures).configure do
    plugin :imagemagick
    plugin :svg
    secret: Rails.application.credentials.secret_key_base
    datastore :s3, aws_config
  end

  Dragonfly.app(:alchemy_attachments).configure do
    datastore :s3, aws_config
  end
end
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
