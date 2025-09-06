# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)

require "alchemy/dragonfly/s3/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "alchemy-dragonfly-s3"
  s.version = Alchemy::Dragonfly::S3::VERSION
  s.authors = ["Thomas von Deyen"]
  s.email = ["thomas@vondeyen.com"]
  s.homepage = "https://github.com/AlchemyCMS/alchemy-dragonfly-s3"
  s.summary = "AlchemyCMS Dragonfly S3."
  s.description = "AlchemyCMS Integration for the Dragonfly S3 datastore."
  s.license = "MIT"

  s.metadata = {
    "source_code_uri" => "https://github.com/AlchemyCMS/alchemy-dragonfly-s3",
    "changelog_uri" => "https://github.com/AlchemyCMS/alchemy-dragonfly-s3/blob/main/CHANGELOG.md",
    "bug_tracker_uri" => "https://github.com/AlchemyCMS/alchemy-dragonfly-s3/issues",
    "github_repo" => "https://github.com/AlchemyCMS/alchemy-dragonfly-s3"
  }

  s.files = Dir[
    "app/**/*",
    "lib/**/*",
    "alchemy-dragonfly-s3.gemspec",
    "CHANGELOG.md",
    "MIT-LICENSE",
    "README.md"
  ]

  s.add_dependency "alchemy_cms", [">= 8.0.0.a", "< 9"]
  s.add_dependency "dragonfly-s3_data_store", "~> 1.3"

  s.add_development_dependency "rspec-rails", "~> 8.0"
  s.add_development_dependency "factory_bot_rails", "~> 6.0"
  s.add_development_dependency "github_changelog_generator"
  s.add_development_dependency "simplecov", "~> 0.17"
end
