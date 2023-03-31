begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

require "rdoc/task"

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title = "Alchemy Dragonfly S3"
  rdoc.options << "--line-numbers"
  rdoc.rdoc_files.include("README.md")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

APP_RAKEFILE = File.expand_path("spec/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"

load "rails/tasks/statistics.rake"

require "bundler/gem_tasks"

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)
task default: [:test_setup, :spec]

desc "Setup test app"
task :test_setup do
  Dir.chdir("spec/dummy") do
    require "active_support/core_ext/string"
    system <<-SETUP.strip_heredoc
      export RAILS_ENV=test && \
      bin/rails g alchemy:install --skip --skip-demo-files --auto-accept
      bin/rails g alchemy:devise:install --force
    SETUP
    exit($?.exitstatus) unless $?.success?
  end
end

require "github_changelog_generator/task"
require "alchemy/dragonfly/s3/version"
GitHubChangelogGenerator::RakeTask.new(:changelog) do |config|
  config.user = "AlchemyCMS"
  config.project = "alchemy-dragonfly-s3"
  config.future_release = "v#{Alchemy::Dragonfly::S3::VERSION}"
end
