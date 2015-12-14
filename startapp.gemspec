lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  spec_file = IO.read(File.expand_path("../client.spec", __FILE__))

  s.name         = %q{startapp}
  s.version      = spec_file.match(/^Version:\s*(.*?)$/mi)[1].chomp

  s.authors      = %q{CloudStrap}
  s.email        = %q{support@cloudstrap.io}
  s.summary      = %q{StartApp Client Tools}
  s.homepage     = %q{https://github.com/cloudstrap/app}
  s.description  = %q{startapp is a command line tool for the CloudStrap.io platform that allow for application management and easy start for new apps.}

  s.files        = Dir['lib/**/*.rb', 'lib/**/*.erb', 'lib/rhc bin/*', 'conf/*', 'autocomplete/*'] + %w(LICENSE COPYRIGHT README.md Rakefile)
  s.test_files   = Dir['{test,spec,features}/**/*']
  s.executables  = Dir['bin/*'].map{ |f| File.basename(f) }
  s.require_path = 'lib'

  s.post_install_message = %q{If this is your first time installing the CloudStrap tools, please run 'app setup'}

  # Format the post install message with some nice separators
  sep = "=" * s.post_install_message.lines.to_a.map(&:chomp).map(&:length).max
  s.post_install_message = [
    sep,
    nil,
    s.post_install_message,
    nil,
    sep
  ].join("\n")

  s.add_dependency              'net-ssh',      '>= 2.0.11', '<= 2.9.2'
  s.add_dependency              'net-scp',      '~> 1.1.2'
  s.add_dependency              'net-ssh-multi','>= 1.2.0'
  s.add_dependency              'archive-tar-minitar'
  s.add_runtime_dependency      'commander',    '>= 4.0', '< 4.3.0'
  s.add_runtime_dependency      'highline',     '~> 1.6.11'
  s.add_runtime_dependency      'httpclient',   '>= 2.4.0', '< 2.7.0'
  s.add_runtime_dependency      'open4'
  s.add_development_dependency  'rake',         '>= 0.8.7'
  s.add_development_dependency  'webmock',      '< 1.12'
  s.add_development_dependency  'rspec',        '>= 2.8.0', '< 2.99'
  s.add_development_dependency  'fakefs',       '>= 0.4', '< 0.6.0'
  s.add_development_dependency  'thor'
  s.add_development_dependency  'cucumber',     '<= 1.3.20'
  s.add_development_dependency  'activesupport', '~> 3.0'
end