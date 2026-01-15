#
# Be sure to run `pod lib lint NovaSdk.podspec' to ensure this is a
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
  s.static_framework = true  # 静态框架必须开启，否则 xcframework 可能加载失败

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
  # 强制所有子依赖的部署版本≥15.0
  s.pod_target_xcconfig = {
        'IPHONEOS_DEPLOYMENT_TARGET' => '15.0',
        'ENABLE_STRICT_DEPLOYMENT_TARGET_CHECKING' => 'YES',
        # 禁用 arclite 库链接（关键修复）
        'CLANG_ALLOW_ARC_LITE' => 'NO'
  }

    # 强制所有用户工程集成该 Pod 时也使用 15.0 部署目标
    s.user_target_xcconfig = {
            'IPHONEOS_DEPLOYMENT_TARGET' => '15.0'
    }


  s.source_files = 'NovaSdk/Classes/**/*.{h,m,swift}'

  # s.resource_bundles = {
  #   'NovaSdk' => ['NovaSdk/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.vendored_frameworks = 'Dependencies/Nova/*.xcframework'
  s.xcconfig = {
        'FRAMEWORK_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/Dependencies/Nova',
        'HEADER_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/NovaSdk/Classes/**',
        'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/Dependencies/Nova',
        'LD_RUNPATH_SEARCH_PATHS' => '@executable_path/Frameworks @loader_path/Frameworks'
}

  s.dependency 'MMKV'
end
