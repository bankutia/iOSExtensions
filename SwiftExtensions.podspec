Pod::Spec.new do |spec|

  spec.name         = "SwiftExtensions"
  spec.version      = "1.0.0"
  spec.summary      = "Useful extensions for Swift."
  spec.description  = "Basic types, missing collection and string functions and many more useful stuff..."
  spec.homepage     = "https://github.com/bankutia/iOSExtensions"
  spec.license      = "MIT"
  spec.author       = { "ALi" => "bankutia@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :path => '.' }
  spec.source_files  = "SwiftExtensions/Common/**/*"
  spec.swift_version = "5.0"

end
