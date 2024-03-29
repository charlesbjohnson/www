# frozen_string_literal: true

require_relative "lib/ssg/version"

Gem::Specification.new do |s|
  s.required_ruby_version = ">= 3.0"

  s.name = "ssg"
  s.version = SSG::VERSION

  s.summary = "Static Site Generator"
  s.authors = ["Charles B Johnson"]

  s.files = Dir.glob(["lib/**/*"])
  s.executables = ["ssg"]

  s.add_runtime_dependency "listen", "~> 3.8"
  s.add_runtime_dependency "webrick", "~> 1.7"
  s.add_runtime_dependency "zeitwerk", "~> 2.6"
end
