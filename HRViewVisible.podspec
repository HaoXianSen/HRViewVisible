#
# Be sure to run `pod lib lint HRViewVisible.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HRViewVisible'
  s.version          = '1.0.0'
  s.summary          = 'Auto collapse a UIView and autolayout constraints'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Make a UIView or it's subviews hide or unhide and automatically hide it's associate constraints
                       DESC

  s.homepage         = 'https://github.com/1335430614@qq.com/HRViewVisible'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'harry' => 'harry_c2016@163.com' }
  s.source           = { :git => 'https://github.com/HaoXianSen/HRViewVisible.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'HRViewVisible/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HRViewVisible' => ['HRViewVisible/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
