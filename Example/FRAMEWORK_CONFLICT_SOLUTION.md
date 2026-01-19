# 解决框架冲突问题

## 问题描述
在执行 `pod install` 或 `pod update` 时出现以下错误：
```
[!] The 'Pods-NovaSdk_Example' target has frameworks with conflicting names: cmpsdk.framework, novacore.framework, ahsdk.framework, tdremoteconfig.framework, tdstrategy.framework, thinkingdatacore.framework, and thinkingsdk.framework.
```

## 问题原因
冲突是由于在 NovaSdk.podspec 中使用了通配符 `Dependencies/**/*.xcframework` 包含所有框架，而这些框架可能也作为独立的 pods 存在，导致重复引用。

## 解决方案

### 步骤 1: 修改 NovaSdk.podspec 文件

将以下内容：

```ruby
s.vendored_frameworks = 'Dependencies/**/*.xcframework'
```

替换为：

```ruby
s.vendored_frameworks = [
  'Dependencies/Nova/NovaCore.xcframework',
  'Dependencies/SignalsGateway/AHSDK.xcframework', 
  'Dependencies/ThinkingData/TDRemoteConfig.xcframework',
  'Dependencies/ThinkingData/TDStrategy.xcframework',
  'Dependencies/ThinkingData/ThinkingDataCore.xcframework',
  'Dependencies/ThinkingData/ThinkingSDK.xcframework',
  'Dependencies/CMP/CmpSdk.xcframework'
]
```

注意：不要包含 SobotKit 相关框架（SobotKit.framework, SobotCommon.framework, SobotChatClient.framework），因为这些应该在单独的 pod 或通过其他方式管理。

### 步骤 2: 修正 xcconfig 配置

同时更新 xcconfig 以确保正确的搜索路径：

```ruby
s.xcconfig = {
  'FRAMEWORK_SEARCH_PATHS' => [
    '$(PODS_ROOT)/NovaSdk/Dependencies/Nova/**',
    '$(PODS_ROOT)/NovaSdk/Dependencies/SignalsGateway/**',
    '$(PODS_ROOT)/NovaSdk/Dependencies/ThinkingData/**',
    '$(PODS_ROOT)/NovaSdk/Dependencies/CMP/**'
  ].join(' '),
  'HEADER_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/NovaSdk/Classes/**',
  'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/Dependencies/Nova',
  'LD_RUNPATH_SEARCH_PATHS' => '@executable_path/Frameworks @loader_path/Frameworks'
}
```

### 步骤 3: 清理并重新安装

执行以下命令：

```bash
cd /Users/wgp/Desktop/NovaSdk/Example
pod deintegrate
rm -rf ~/Library/Developer/Xcode/DerivedData/NovaSdk-*
pod install
```

### 步骤 4: 处理 SobotKit 模块

如果您的代码中需要使用 SobotKit，请确保：

1. 在项目中正确导入 SobotKit 框架
2. 如果 SobotKit 作为独立的 pod 提供，则应在 Podfile 中添加相应依赖
3. 如果 SobotKit 只能通过 vendored_frameworks 引入，则需要单独处理，避免与其他依赖冲突

## 注意事项

1. 确保只包含 NovaSdk 项目独有的框架，避免与公共 pod 仓库中的框架冲突
2. 对于可能作为独立 pod 存在的框架，优先使用 pod 依赖而非 vendored_frameworks
3. 定期检查是否有重复的依赖项