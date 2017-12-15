#
# Be sure to run `pod lib lint Universal_iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Universal_iOS'
  s.version          = '0.1.0'
  s.summary          = 'Universal ios code'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Universal code to start ios project
                       DESC

  s.homepage         = 'https://github.com/abhimalamkar/Universal_iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abhijeet Malamkar' => 'abhijeetmalamkar@gmail.com' }
  s.source           = { :git => 'https://github.com/abhimalamkar/Universal_iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/abhimalamkar'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Universal_iOS/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Universal_iOS' => ['Universal_iOS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
    #s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'Firebase', '~> 4.7'
    s.dependency 'Firebase/Database', '~> 4.7'
    s.dependency 'Firebase/Auth', '~> 4.7'
    s.dependency 'Firebase/Storage', '~> 4.7'
#s.dependency 'SnapKit', '~> 4.0.0'

end
