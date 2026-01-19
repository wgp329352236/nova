# Be sure to run `pod lib lint NovaSdk.podspec` to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NovaSdk'
  s.version          = '0.1.0'
  s.summary          = 'A short description of NovaSdk.'
  s.swift_versions   = ['5.8']
  s.static_framework = true

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/WGP/NovaSdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WGP' => 'wgp329352236@gmail.com' }
  s.source           = { :git => 'https://github.com/WGP/NovaSdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'
  s.pod_target_xcconfig = {
        'ENABLE_BITCODE' => 'NO',
        'ENABLE_STRICT_DEPLOYMENT_TARGET_CHECKING' => 'YES',
        'CLANG_ALLOW_ARC_LITE' => 'NO',
        # 关键：解决PSM类重复问题
        'GCC_SYMBOLS_PRIVATE_EXTERN' => 'YES',
        'OTHER_LDFLAGS' => ['-ObjC', '-fobjc-arc', '-undefined dynamic_lookup', '-Xlinker', '-no_deduplicate_classes'],
        'DEBUG_INFORMATION_FORMAT' => 'dwarf-with-dsym',
        'COPY_PHASE_STRIP' => 'NO'
  }

  s.source_files = 'NovaSdk/Classes/**/*.{h,m,swift}'
  s.exclude_files = [
      'NovaSdk/Classes/**/PSM*.{h,m,mm,cpp,swift}',
      'NovaSdk/Classes/**/PSM*/**/*.{h,m,mm,cpp,swift}',
      'NovaSdk/Classes/**/*PSM*.{h,m,mm,cpp,swift}',
      'NovaSdk/Classes/**/*psm*.{h,m,mm,cpp,swift}',
      'NovaSdk/Classes/**/psm*/**/*.{h,m,mm,cpp,swift}'
  ]

  # 2. 配置资源 Bundle（关键）
  # 格式：{ 'Bundle名称' => ['资源路径'] }
  s.resource_bundles = {
    'SdkResources' => [
        'NovaSdk/Assets/**/*',  # 匹配 Assets 下所有资源（包括子目录）
          # 也可精确指定：'NovaSdk/Assets/Images/*.png'
          ]
  }


  s.frameworks = 'UIKit', 'Foundation'
  s.vendored_frameworks = [
    'Dependencies/Nova/*.xcframework',
    'Dependencies/CMP/*.xcframework',

    'Dependencies/ThinkingData/*.xcframework',
    'Dependencies/Sobot/*.framework'
  ]

  s.xcconfig = {
        'FRAMEWORK_SEARCH_PATHS' => ['$(PODS_ROOT)/../Dependencies/*/**'],
        'HEADER_SEARCH_PATHS' => ['$(PODS_ROOT)/../NovaSdk/Classes/**'],
        'SWIFT_INCLUDE_PATHS' => ['$(PODS_ROOT)/../Dependencies/Nova'],
        'OTHER_LDFLAGS' => ['-ObjC', '-fobjc-arc', '-all_load'],
        'LD_RUNPATH_SEARCH_PATHS' => '@executable_path/Frameworks @loader_path/Frameworks',
        'ALWAYS_SEARCH_USER_PATHS' => 'NO'
  }

  s.dependency 'MMKV', '~> 2.3.0'
  s.dependency 'Adjust', '~> 5.5.1'
  s.dependency 'SnapKit', '~> 5.7.1'
  s.dependency 'MBProgressHUD', '~> 1.2.0'
  s.dependency 'HandyJSON', '~> 5.0.2'

# Facebook
  s.dependency 'FBSDKCoreKit_Basics'
  s.dependency 'FBSDKCoreKit'
  s.dependency 'FBSDKLoginKit'
  s.dependency 'FBSDKShareKit'
  s.dependency 'FBAEMKit'

# Firebase
  s.dependency 'FirebaseCore'
  s.dependency 'FirebaseAnalytics'
  s.dependency 'FirebaseCrashlytics'
  s.dependency 'FirebaseMessaging'
  s.dependency 'FirebaseAppCheck'
#   s.dependency 'FirebaseAnalyticsOnDeviceConversion'
  s.dependency 'GoogleSignIn'

end
