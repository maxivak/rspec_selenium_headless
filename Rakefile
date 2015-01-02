require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')

  #t.rspec_opts << '-r ./rspec_config --color -f d'
  #t.rspec_opts = '--format documentation'
  
  #t.rcov      = true
  # t.rcov_opts = ENV["RCOV_OPTS"]
end
