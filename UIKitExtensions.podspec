Pod::Spec.new do |spec|

  spec.name         = "UIKitExtensions"
  spec.version      = "1.0.0"
  spec.summary      = "Useful extensions for UIKit."
  spec.description  = "Styling basics, dynamic font scaling helper and so on..."
  spec.homepage     = "https://github.com/bankutia/iOSExtensions"
  spec.license      = "MIT"
  spec.author       = { "ALi" => "bankutia@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :path => '.' }
  spec.source_files  = "UIKitExtensions/SharedUI/**/*",  "UIKitExtensions/Protocols"
  spec.swift_version = "5.0"
  
  spec.framework = "UIKit"
  spec.dependency "SwiftExtensions"
  spec.dependency "CombineCocoa"

end
