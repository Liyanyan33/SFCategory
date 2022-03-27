#
# Be sure to run `pod lib lint SFCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SFCategory'
  s.version          = '0.0.1'
  s.summary          = 'SFCategory is a repository about category'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SFCategory is a repository about category by liyanyan33
                       DESC

  s.homepage         = 'https://github.com/Liyanyan33/SFCategory.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '19053601' => '1143386318@qq.com' }
  s.source           = { :git => 'https://github.com/Liyanyan33/SFCategory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SFCategory/Classes/SFCategory.h'
  s.public_header_files = 'SFCategory/Classes/SFCategory.h'
  
  s.subspec 'NSDate' do |ss|
      ss.source_files = "SFCategory/Classes/NSDate/*.{h,m}"
  end
  
  s.subspec 'NSString' do |ss|
      ss.source_files = "SFCategory/Classes/NSString/*.{h,m}"
  end

  s.subspec 'UIColor' do |ss|
      ss.source_files = "SFCategory/Classes/UIColor/*.{h,m}"
  end

  s.subspec 'UIImage' do |ss|
      ss.source_files = "SFCategory/Classes/UIImage/*.{h,m}"
  end

  s.subspec 'NSArray' do |ss|
      ss.source_files = "SFCategory/Classes/NSArray/*.{h,m}"
  end
  
  s.subspec 'UIView' do |ss|
      ss.source_files = "SFCategory/Classes/UIView/*.{h,m}"
      ss.dependency 'MBProgressHUD','0.9.1'
  end
  
  # s.resource_bundles = {
  #   'SFCategory' => ['SFCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end
