#
# Be sure to run `pod lib lint FCExtensionSwiftKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FCExtensionSwiftKit'
  s.version          = '0.0.2'
  s.summary          = 'A short description of FCExtensionSwiftKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Q007shi/FCExtensionSwiftKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '2585299617@qq.com' => '2585299617@qq.com' }
  s.source           = { :git => 'https://github.com/Q007shi/FCExtensionSwiftKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
#  s.swift_versions = ['5.0', '5.1']
  s.requires_arc = true

  s.source_files = 'FCExtensionSwiftKit/Classes/**/*.swift'

  #字符串
#  s.subspec 'StringExtension' do |sp|
#      sp.source_files = 'FCExtensionSwiftKit/Classes/StringExtension/**/*.swift'
#  end

  #颜色
#  s.subspec 'ColorExtension' do |sp|
#      sp.source_files = 'FCExtensionSwiftKit/Classes/StringExtension/**/*.swift','FCExtensionSwiftKit/Classes/ColorExtension/**/*.swift'
#  end

  #按钮
#  s.subspec 'ButtonExtension' do |sp|
#      sp.source_files = 'FCExtensionSwiftKit/Classes/ColorExtension/**/*.swift','FCExtensionSwiftKit/Classes/ButtonExtension/**/*.swift'
#  end
  
  # s.resource_bundles = {
  #   'FCExtensionSwiftKit' => ['FCExtensionSwiftKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
