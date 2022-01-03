Pod::Spec.new do |spec|

  spec.name         = "CombineViper"
  spec.version      = "1.0.0"
  spec.summary      = "Base classes for reactive VIPER pattern"
  spec.description  = "Reactive VIPER pattern implementing with Apple reactive framework called Combine."
  spec.homepage     = "https://github.com/bankutia/iOSExtensions"
  spec.license      = "MIT"
  spec.author       = { "ALi" => "bankutia@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :path => '.' }
  spec.source_files = "CombineViper/Base", "CombineViper/DI"
  spec.resources    = "CombineViper/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
  spec.swift_version = "5.0"

  spec.framework = "UIKit"
  spec.dependency "UIKitExtensions"
  spec.dependency "Moya"
  spec.dependency "Swinject"
  
end

