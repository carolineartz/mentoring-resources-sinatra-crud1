# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rerun"
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Chaffee"]
  s.date = "2014-05-05"
  s.description = "Restarts your app when a file changes. A no-frills, command-line alternative to Guard, Shotgun, Autotest, etc."
  s.email = "alex@stinky.com"
  s.executables = ["rerun"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["bin/rerun", "README.md"]
  s.homepage = "http://github.com/alexch/rerun/"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Launches an app, and restarts it whenever the filesystem changes. A no-frills, command-line alternative to Guard, Shotgun, Autotest, etc."

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<listen>, [">= 2.7.3", "~> 2.7"])
    else
      s.add_dependency(%q<listen>, [">= 2.7.3", "~> 2.7"])
    end
  else
    s.add_dependency(%q<listen>, [">= 2.7.3", "~> 2.7"])
  end
end
