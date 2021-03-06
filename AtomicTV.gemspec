# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: AtomicTV 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "AtomicTV"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Olly Legg"]
  s.date = "2014-03-17"
  s.description = "A command line tool to tag MP4 TV shows with metadata pulled from TheTVDB.com. It uses AtomicParsley to process the file."
  s.email = "olly@51degrees.net"
  s.executables = ["AtomicTV"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "AtomicTV.gemspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/AtomicTV",
    "lib/AtomicTV.rb",
    "lib/AtomicTV/atomic_parsley_tagger.rb",
    "lib/AtomicTV/episode_metadata.rb",
    "lib/AtomicTV/filename_parser.rb",
    "lib/AtomicTV/tvdb_episode.rb",
    "spec/AtomicTV/atomic_parsley_tagger_spec.rb",
    "spec/AtomicTV/episode_metadata_spec.rb",
    "spec/AtomicTV/filename_parser_spec.rb",
    "spec/AtomicTV/tvdb_episode_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/olly/AtomicTV"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.0"
  s.summary = "A command line tool to tag MP4 TV shows with metadata pulled from TheTVDB.com."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<plist>, ["= 3.1.0"])
      s.add_runtime_dependency(%q<tvdb_party>, ["= 0.6.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<plist>, ["= 3.1.0"])
      s.add_dependency(%q<tvdb_party>, ["= 0.6.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<plist>, ["= 3.1.0"])
    s.add_dependency(%q<tvdb_party>, ["= 0.6.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
  end
end

