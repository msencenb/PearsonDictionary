#
# Be sure to run `pod lib lint PearsonDictionary.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PearsonDictionary"
  s.version          = "0.1.0"
  s.summary          = "An in development pod for accessing the Pearson Dictionary API."
  s.description      = <<-DESC
                       Pearson Dictionary is a verbose dictionary API you can access on (developer.pearson.com)[http://developer.pearson.com/]. This cocoapod is intended to provide easy iOS access to their (dictionary API)[http://developer.pearson.com/apis/dictionaries], but is still in the early stages of development. An API key is needed to use this cocoapod (it's free!).
                       DESC
  s.homepage         = "https://github.com/msencenb/PearsonDictionary"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Matt Sencenbaugh" => "matt.sencenbaugh@gmail.com" }
  s.source           = { :git => "https://github.com/msencenb/PearsonDictionary.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PearsonDictionary' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
