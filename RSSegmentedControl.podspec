#
# Be sure to run `pod lib lint RSSegmentedControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'RSSegmentedControl'
s.version          = '2.0.2'
s.summary          = '基于Masonry的分段控制器.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
如果你的布局使用Masonry，那么这是你最好的选择。
DESC
s.dependency 'Masonry', '~> 1.0.0'

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

# s.public_header_files = 'RSSegmentedControl/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.prefix_header_contents = ['#import <UIKit/UIKit.h>', '#import <Masonry/Masonry.h>']

end

