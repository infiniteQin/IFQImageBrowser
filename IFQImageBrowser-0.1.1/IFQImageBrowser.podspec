Pod::Spec.new do |s|
  s.name = "IFQImageBrowser"
  s.version = "0.1.1"
  s.summary = "images browser"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"infiniteQin"=>"whcwylp@163.com"}
  s.homepage = "https://github.com/infiniteQin/IFQImageBrowser"
  s.description = "images browser support NSString|NSData|UIImage"
  s.frameworks = "UIKit"
  s.requires_arc = true
  s.source = { :path => '.' }

  s.ios.deployment_target    = '7.0'
  s.ios.vendored_framework   = 'ios/IFQImageBrowser.framework'
end
