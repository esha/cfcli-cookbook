require 'chefspec'
require 'chefspec/berkshelf'

begin
  require 'simplecov'
  formatters = [SimpleCov::Formatter::HTMLFormatter]

  begin
    require 'coveralls'
    Coveralls.wear!
    formatters << Coveralls::SimpleCov::Formatter
  rescue LoadError
    puts '>>>>> Not reporting to Coveralls because gem not loaded.'
  end

  begin
    require 'codeclimate-test-reporter'
    formatters << CodeClimate::TestReporter::Formatter if ENV['CODECLIMATE_REPO_TOKEN']
  rescue LoadError
    puts '>>>>> Not reporting to CodeClimate because gem not loaded.'
  end

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]
  SimpleCov.start
rescue LoadError
  puts '>>>>> Not analyzing code coverage because SimpleCov gem not loaded.'
end
