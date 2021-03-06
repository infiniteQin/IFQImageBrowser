#
# Be sure to run `pod lib lint IFQImageBrowser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IFQImageBrowser'
  s.version          = '0.1.4'
  s.summary          = 'images browser'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC

    images browser support NSString|NSData|UIImage

                       DESC

  s.homepage         = 'https://github.com/infiniteQin/IFQImageBrowser'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'infiniteQin' => 'whcwylp@163.com' }
  s.source           = { :git => 'https://github.com/infiniteQin/IFQImageBrowser.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.requires_arc          = true

  # s.resource_bundles = {
  #   'IFQImageBrowser' => ['IFQImageBrowser/Assets/*.png']
  # }

  
    s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.default_subspec = 'All'

  s.subspec 'All' do |ss|
    ss.dependency 'IFQImageBrowser/WebImageLoader'
  end
  
  s.subspec 'Base' do |ss|
    ss.source_files = 'IFQImageBrowser/Base/*.{h,m}','IFQImageBrowser/Base/**/*.{h,m}','IFQImageBrowser/*.{h,m}'
    ss.public_header_files   =  'IFQImageBrowser/Base/Controller/*.{h}','IFQImageBrowser/Base/Protocol/*.{h}','IFQImageBrowser/*.{h}'

  end

  s.subspec 'TitleBar' do |ss|
    ss.dependency 'IFQImageBrowser/Base'
    ss.source_files   = 'IFQImageBrowser/TitleBar/*.{h,m}','IFQImageBrowser/TitleBar/**/*.{h,m}'
    ss.private_header_files = 'IFQImageBrowser/TitleBar/**/*.{h}'
    ss.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'SHOW_TITLE_BAR=1'}
  end

  s.subspec 'WithoutImageLoader' do |ss|
    ss.dependency 'IFQImageBrowser/Base'
    ss.dependency 'IFQImageBrowser/TitleBar'
  end

  s.subspec 'WebImageLoader' do |ss|
    ss.dependency 'SDWebImage'
    ss.dependency 'IFQImageBrowser/Base'
    ss.source_files   = 'IFQImageBrowser/WebImgLoader/*.{h,m}','IFQImageBrowser/WebImgLoader/**/*.{h,m}'
    ss.private_header_files = 'IFQImageBrowser/WebImgLoader/**/*.{h}'
    ss.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'IFQ_WEB_IMG_LOADER=1'}
  end

end
