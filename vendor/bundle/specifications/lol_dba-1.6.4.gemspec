# -*- encoding: utf-8 -*-
# stub: lol_dba 1.6.4 ruby lib lib/lol_dba

Gem::Specification.new do |s|
  s.name = "lol_dba"
  s.version = "1.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib", "lib/lol_dba"]
  s.authors = ["Diego Plentz", "Elad Meidar", "Eric Davis", "Muness Alrubaie", "Vladimir Sharshov"]
  s.date = "2014-09-20"
  s.description = "lol_dba is a small package of rake tasks that scan your application models and displays a list of columns that probably should be indexed. Also, it can generate .sql migration scripts."
  s.email = ["diego@plentz.org", "elad@eizesus.com", "", "vsharshov@gmail.com"]
  s.executables = ["lol_dba"]
  s.files = ["bin/lol_dba"]
  s.homepage = "https://github.com/plentz/lol_dba"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.1")
  s.rubygems_version = "2.2.2"
  s.summary = "A small package of rake tasks to track down missing database indexes and generate sql migration scripts"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.0"])
      s.add_runtime_dependency(%q<railties>, [">= 3.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0"])
      s.add_dependency(%q<actionpack>, [">= 3.0"])
      s.add_dependency(%q<railties>, [">= 3.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0"])
    s.add_dependency(%q<actionpack>, [">= 3.0"])
    s.add_dependency(%q<railties>, [">= 3.0"])
  end
end
