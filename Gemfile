source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem"s dependencies in alchemy_s3.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

ENV.fetch("ALCHEMY_BRANCH", "4.6-stable").tap do |branch|
  gem "alchemy_cms", github: "AlchemyCMS/alchemy_cms", branch: branch
  gem "alchemy-devise", github: "AlchemyCMS/alchemy-devise", branch: branch
end
gem "sqlite3", "~> 1.3"
gem "sassc-rails", "~> 2.1"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
gem "pry-byebug", group: [:development, :test]
