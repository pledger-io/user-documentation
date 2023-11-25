# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "user-documentation"
  spec.version       = "1.0.0"
  spec.authors       = ["Jong Soft Development"]
  spec.email         = ["no-reply@jong-soft.com"]

  spec.summary       = "Pledger.io documentation."
  spec.homepage      = "https://bitbucket.org/jongsoftdev/user-documentation/src/master/"
  spec.license       = "MIT"

  spec.files         = `git ls-files docs -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3.2"

  spec.add_development_dependency "bundler", "~> 2.2.4"
  spec.add_development_dependency "rake", "~> 13.0"
end
