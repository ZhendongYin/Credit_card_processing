# frozen_string_literal: true

require_relative "lib/credit_card_system/version"

Gem::Specification.new do |spec|
  spec.name = "credit_card_system"
  spec.version = CreditCardSystem::VERSION
  spec.authors = ["Zhendong Yin"]
  spec.email = ["zhendongyin@brandeis.edu"]

  spec.summary = "Credit Card System"
  spec.description = "Credit Card System"
  # spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"


  # Very simple library to calculate and validate Luhn numbers
  spec.add_dependency 'luhn-ruby', '~> 1.0'

  # BDD for Ruby
  spec.add_development_dependency 'rspec', '~> 3.12'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
