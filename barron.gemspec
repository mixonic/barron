Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'barron'
  s.version           = '0.1.2'
  s.date              = '2012-01-04'

  s.summary     = "Barron helps you with locking"
  s.description = "Barron uses file-system locks, but eventually configurable backends would be nice. Robert Barron patented a double-acting tumbler lock in 1778."

  s.authors  = ["Matthew Beale"]
  s.email    = 'matt.beale@madhatted.com'
  s.homepage = 'http://github.com/mixonic/barron'

  s.require_paths = %w[lib]

  s.executables = ["barron"]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[]

  s.add_development_dependency('rake', "~> 0.9")
  s.add_development_dependency('rdoc', "~> 3.11")
  
  # = MANIFEST =
  s.files = %w[
    Gemfile
    Rakefile
    barron.gemspec
    bin/barron
    lib/barron.rb
    lib/barron/tmpfile.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
