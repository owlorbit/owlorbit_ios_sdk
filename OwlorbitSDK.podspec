#
# Be sure to run `pod lib lint OwlorbitSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OwlorbitSDK'
  s.version          = '1.0.3'
  s.summary          = 'This is the official SDK for Owlorbit API.'

  s.description      = <<-DESC
Official SDK for Owlorbit Api
                       DESC

  s.homepage         = 'https://github.com/owlorbit/owlorbit_ios_sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Owlorbit' => 'tim.nguyen@owlorbit.com' }
  s.source           = { :git => 'https://github.com/owlorbit/owlorbit_ios_sdk.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/owlorbit'

  s.ios.deployment_target = '8.0'

  s.source_files = 'OwlorbitSDK/Classes/**/*'
  
  s.swift_version  = '3.0'
  s.dependency 'Alamofire', '~> 4.4'
  s.dependency 'SwiftyJSON', '~> 3.1.4'
  s.dependency 'ObjectMapper', '~> 2.0'
  s.dependency 'AlamofireObjectMapper', '~> 4.0'
  
end
