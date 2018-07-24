#
# Be sure to run `pod lib lint RSSegmentedControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RSSegmentedControl'
  s.version          = '1.0.0'
  s.summary          = 'Masonry-Based SegmentedControl.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        Easily used in Masonry layout.
                       DESC

  s.homepage         = 'https://github.com/rsers/RSSegmentedControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rsers' => 'rsers@qq.com' }
  s.source           = { :git => 'https://github.com/rsers/RSSegmentedControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RSSegmentedControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RSSegmentedControl' => ['RSSegmentedControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit'
    s.dependency 'Masonry', '~> 1.0.0'
    s.prefix_header_contents = '#import <UIKit/UIKit.h>', '#import "Masonry.h"'
end
