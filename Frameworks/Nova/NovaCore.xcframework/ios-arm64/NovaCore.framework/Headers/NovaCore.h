#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSError.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

@class NovaCoreConfiguredEvent, NovaCoreEventHub<EventType>, NovaCoreFetchConfigFinishedEvent, NovaCorePlayerConnectedEvent, NovaCorePlayerSwitchedEvent, NovaCoreShareFinishedEvent, NovaCoreTokenRefreshEvent, NovaCoreLanguage, NovaCoreKotlinUnit, NovaCorePromiseInterface<ResultType>, NovaCorePlayer, NovaCorePlatform, NovaCorePlatformCredentials, NovaCorePlatformConnectionInfo, NovaCoreKotlinArray<T>, NovaCoreAdType, NovaCoreAdMediation, NovaCoreAgreementType, NovaCoreLoginHistory, NovaCorePurchaseResult, NovaCorePurchaseEvent, NovaCorePlayIntegrityStatus, NovaCoreVerificationCodeType, NovaCoreServerType, NovaCoreAdResult, NovaCoreVerifyStatus, NovaCorePayOrder, NovaCoreBackgroundEvents, NovaCoreClientInfo, NovaCoreGameRole, NovaCoreGameTheme, NovaCoreRemoteGameConfig, NovaCoreTrackingKit, NovaCoreAdParams, NovaCoreDeregister, NovaCoreTipsInfo, NovaCoreRegionalAgent, NovaCoreBrowserType, NovaCoreHttpClient, NovaCoreSdkReleaseInfo, NovaCorePlatformCredentialsCompanion, NovaCoreAccessTokenVerifiedCredentialsCompanion, NovaCoreAdCustomerDataCompanion, NovaCoreKotlinEnumCompanion, NovaCoreKotlinEnum<E>, NovaCoreAdErrorType, NovaCoreAdMediationCompanion, NovaCoreAdOptionalParamsCompanion, NovaCoreAdParamsCompanion, NovaCoreAdResultCompanion, NovaCoreAppleVerifiedCredentialsCompanion, NovaCoreBrowserTypeCompanion, NovaCoreClientInfoCompanion, NovaCoreConnectPlatformCompanion, NovaCoreConnectPlatform, NovaCoreKotlinx_serialization_coreSerializersModule, NovaCoreColor, NovaCoreKotlinx_serialization_jsonJsonElement, NovaCoreDeregisterCompanion, NovaCoreDeviceVerifiedCredentialsCompanion, NovaCoreDnsRecordCompanion, NovaCoreEmailCodeCredentialsCompanion, NovaCoreRevealedPlatform, NovaCoreGamePlayerCompanion, NovaCoreGamePlayer, NovaCoreGameRoleCompanion, NovaCoreGameThemeBase, NovaCoreThemeBorderTextField, NovaCoreThemeButton, NovaCoreThemeCell, NovaCoreThemeColor, NovaCoreThemeTitle, NovaCoreThemeLine, NovaCoreTheme, NovaCoreIntegrityConfigCompanion, NovaCoreIntegrityConfig, NovaCoreLimitTokenVerifiedCredentialsCompanion, NovaCoreGameConfigBase, NovaCoreLoginHistoryCompanion, NovaCoreVerifiablePlatform, NovaCoreMessageHandler, NovaCoreMessageType, NovaCoreMessageHandlerCompanion, NovaCoreMessageTypeCompanion, NovaCoreOnlineDataCompanion, NovaCorePlatformCompanion, NovaCorePlayerCompanion, NovaCorePlayerTokenCompanion, NovaCoreRefreshTokenCompanion, NovaCoreRefreshTokenVerifiedCredentialsCompanion, NovaCoreRegionalAgentCompanion, NovaCoreRemoteGameConfigCompanion, NovaCoreWeightedRandom, NovaCoreSocialMedia, NovaCoreRevealedPlatformCompanion, NovaCoreServerTypeCompanion, NovaCoreSocialPlatform, NovaCoreShareElement, NovaCoreShareStatus, NovaCoreShareResultCompanion, NovaCoreShareResult, NovaCoreSharingDataCompanion, NovaCoreSocialMediaCompanion, NovaCoreSocialMediaItem, NovaCoreSocialMediaItemCompanion, NovaCoreSocialPlatformCompanion, NovaCoreThemeCompanion, NovaCoreTipsStatus, NovaCoreTipsInfoCompanion, NovaCoreTipsStatusCompanion, NovaCorePlayerToken, NovaCoreRefreshToken, NovaCoreTokenDataCompanion, NovaCoreTokenData, NovaCoreVerifiablePlatformCompanion, NovaCoreWeightedRandomCompanion, NovaCoreofficialWebsiteCompanion, NovaCoreofficialWebsite, NovaCoreBackgroundEvent, NovaCoreLanguageCompanion, NovaCoreLogTraceInfo, NovaCoreLogLevel, NovaCoreLogLevelCompanion, NovaCoreLogTraceInfoCompanion, NovaCoreLoggerInterfaceCompanion, NovaCorePersistentStorageLoggerCompanion, NovaCoreRunningPlatform, NovaCoreRestfulHttpPromise, NovaCoreRestfulHttpRequest, NovaCoreHttpMethod, NovaCoreHttpScheme, NovaCoreHttpUtil, NovaCoreWaitable, NovaCoreRestfulHttpResponse, NovaCoreKotlinThrowable, NovaCorePromiseState, NovaCorePromiseCompanion, NovaCorePromise<ResultType>, NovaCoreRestfulHttpRequestPostDataBuilder, NovaCoreRestfulHttpRequestHeaderBuilder, NovaCoreRestfulHttpRequestQueryParameterBuilder, NovaCoreProductInfo, NovaCorePaymentEvent, NovaCorePaymentProcessToastType, NovaCoreDeliveryStatusCompanion, NovaCoreDeliveryStatus, NovaCoreOrderPayLoadCompanion, NovaCoreOrderPayLoad, NovaCoreOwnerTypeCompanion, NovaCoreOwnerType, NovaCorePayOrderCompanion, NovaCorePurchaseStatus, NovaCorePlaceOrderResultCompanion, NovaCoreProcessToastType, NovaCoreProductInfoCompanion, NovaCoreProductTypeCompanion, NovaCoreProductType, NovaCorePurchaseResultCompanion, NovaCorePurchaseStatusCompanion, NovaCoreVerifyStatusCompanion, NovaCoreKotlinError, NovaCorePaymentBaseReason, NovaCoreApiStatusCode, NovaCoreEngineService, NovaCoreNullableParametersSerializer, NovaCorePaymentApiStatusCode, NovaCorePaymentOptionalParamsCompanion, NovaCoreBaseEvent, NovaCorePackageSettingsKey, NovaCorePackageSettingsKeyAdjust, NovaCorePackageSettingsKeyAdmob, NovaCorePackageSettingsKeyApplovin, NovaCorePackageSettingsKeyClient, NovaCorePackageSettingsKeyDma, NovaCorePackageSettingsKeyFacebook, NovaCorePackageSettingsKeyFirebase, NovaCorePackageSettingsKeyHHGame, NovaCorePackageSettingsKeyKakao, NovaCorePackageSettingsKeyLine, NovaCorePackageSettingsKeySoBot, NovaCorePackageSettingsKeyTD, NovaCorePersistentKey, NovaCorePromptTaskQueueTaskLevel, NovaCorePromptTaskQueueTaskStatus, NovaCoreTimerTaskType, NovaCoreTimerTask, NovaCoreAccountUpdateListener, NovaCoreAdEventInfo, NovaCoreTiktokEventName, NovaCoreTrackingEventName, NovaCoreTrackingEventParameter, NovaCoreAdEventTracking, NovaCoreEventParamCollection, NovaCoreOnlineListener, NovaCoreTrackingKitTrackingConsumerCompanion, NovaCoreDataValidUtil, NovaCorePlaceHolderUtil, NovaCorePlatformUtil, NovaCorePromiseHandler<ResultType>, NovaCoreSocialPlatformUtils, NovaCoreKotlinByteArray, NovaCoreTraceElement, NovaCoreKotlinx_serialization_jsonJsonElementCompanion, NovaCoreKotlinx_serialization_coreSerialKind, NovaCoreKotlinNothing, NovaCoreKotlinByteIterator;

@protocol NovaCoreEngineInterface, NovaCoreDnsClientEngine, NovaCoreRestfulHttpEngine, NovaCoreTimerEngine, NovaCoreMutableKVStorage, NovaCoreReadonlyKVStorage, NovaCorePaymentHandlerInterface, NovaCoreToolFunctionInterface, NovaCoreKotlinx_serialization_coreKSerializer, NovaCoreKotlinComparable, NovaCoreKotlinKClass, NovaCoreCredentialSerializerProvider, NovaCoreLoggerInterface, NovaCoreRejectable, NovaCoreKotlinx_serialization_coreEncoder, NovaCoreKotlinx_serialization_coreSerialDescriptor, NovaCoreKotlinx_serialization_coreSerializationStrategy, NovaCoreKotlinx_serialization_coreDecoder, NovaCoreKotlinx_serialization_coreDeserializationStrategy, NovaCoreKotlinIterator, NovaCoreKotlinx_serialization_coreSerializersModuleCollector, NovaCoreKotlinKDeclarationContainer, NovaCoreKotlinKAnnotatedElement, NovaCoreKotlinKClassifier, NovaCoreKotlinx_serialization_coreCompositeEncoder, NovaCoreKotlinAnnotation, NovaCoreKotlinx_serialization_coreCompositeDecoder;

NS_ASSUME_NONNULL_BEGIN
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-warning-option"
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wnullability"

#pragma push_macro("_Nullable_result")
#if !__has_feature(nullability_nullable_result)
#undef _Nullable_result
#define _Nullable_result _Nullable
#endif

__attribute__((swift_name("KotlinBase")))
@interface NovaCoreBase : NSObject
- (instancetype)init __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
+ (void)initialize __attribute__((objc_requires_super));
@end

@interface NovaCoreBase (NovaCoreBaseCopying) <NSCopying>
@end

__attribute__((swift_name("KotlinMutableSet")))
@interface NovaCoreMutableSet<ObjectType> : NSMutableSet<ObjectType>
@end

__attribute__((swift_name("KotlinMutableDictionary")))
@interface NovaCoreMutableDictionary<KeyType, ObjectType> : NSMutableDictionary<KeyType, ObjectType>
@end

@interface NSError (NSErrorNovaCoreKotlinException)
@property (readonly) id _Nullable kotlinException;
@end

__attribute__((swift_name("KotlinNumber")))
@interface NovaCoreNumber : NSNumber
- (instancetype)initWithChar:(char)value __attribute__((unavailable));
- (instancetype)initWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
- (instancetype)initWithShort:(short)value __attribute__((unavailable));
- (instancetype)initWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
- (instancetype)initWithInt:(int)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
- (instancetype)initWithLong:(long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
- (instancetype)initWithLongLong:(long long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
- (instancetype)initWithFloat:(float)value __attribute__((unavailable));
- (instancetype)initWithDouble:(double)value __attribute__((unavailable));
- (instancetype)initWithBool:(BOOL)value __attribute__((unavailable));
- (instancetype)initWithInteger:(NSInteger)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
+ (instancetype)numberWithChar:(char)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
+ (instancetype)numberWithShort:(short)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
+ (instancetype)numberWithInt:(int)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
+ (instancetype)numberWithLong:(long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
+ (instancetype)numberWithLongLong:(long long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
+ (instancetype)numberWithFloat:(float)value __attribute__((unavailable));
+ (instancetype)numberWithDouble:(double)value __attribute__((unavailable));
+ (instancetype)numberWithBool:(BOOL)value __attribute__((unavailable));
+ (instancetype)numberWithInteger:(NSInteger)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
@end

__attribute__((swift_name("KotlinByte")))
@interface NovaCoreByte : NovaCoreNumber
- (instancetype)initWithChar:(char)value;
+ (instancetype)numberWithChar:(char)value;
@end

__attribute__((swift_name("KotlinUByte")))
@interface NovaCoreUByte : NovaCoreNumber
- (instancetype)initWithUnsignedChar:(unsigned char)value;
+ (instancetype)numberWithUnsignedChar:(unsigned char)value;
@end

__attribute__((swift_name("KotlinShort")))
@interface NovaCoreShort : NovaCoreNumber
- (instancetype)initWithShort:(short)value;
+ (instancetype)numberWithShort:(short)value;
@end

__attribute__((swift_name("KotlinUShort")))
@interface NovaCoreUShort : NovaCoreNumber
- (instancetype)initWithUnsignedShort:(unsigned short)value;
+ (instancetype)numberWithUnsignedShort:(unsigned short)value;
@end

__attribute__((swift_name("KotlinInt")))
@interface NovaCoreInt : NovaCoreNumber
- (instancetype)initWithInt:(int)value;
+ (instancetype)numberWithInt:(int)value;
@end

__attribute__((swift_name("KotlinUInt")))
@interface NovaCoreUInt : NovaCoreNumber
- (instancetype)initWithUnsignedInt:(unsigned int)value;
+ (instancetype)numberWithUnsignedInt:(unsigned int)value;
@end

__attribute__((swift_name("KotlinLong")))
@interface NovaCoreLong : NovaCoreNumber
- (instancetype)initWithLongLong:(long long)value;
+ (instancetype)numberWithLongLong:(long long)value;
@end

__attribute__((swift_name("KotlinULong")))
@interface NovaCoreULong : NovaCoreNumber
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value;
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value;
@end

__attribute__((swift_name("KotlinFloat")))
@interface NovaCoreFloat : NovaCoreNumber
- (instancetype)initWithFloat:(float)value;
+ (instancetype)numberWithFloat:(float)value;
@end

__attribute__((swift_name("KotlinDouble")))
@interface NovaCoreDouble : NovaCoreNumber
- (instancetype)initWithDouble:(double)value;
+ (instancetype)numberWithDouble:(double)value;
@end

__attribute__((swift_name("KotlinBoolean")))
@interface NovaCoreBoolean : NovaCoreNumber
- (instancetype)initWithBool:(BOOL)value;
+ (instancetype)numberWithBool:(BOOL)value;
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("BackgroundEvents")))
@interface NovaCoreBackgroundEvents : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (readonly) NovaCoreEventHub<NovaCoreConfiguredEvent *> *configured __attribute__((swift_name("configured")));
@property (readonly) NovaCoreEventHub<NovaCoreFetchConfigFinishedEvent *> *fetchConfigFinished __attribute__((swift_name("fetchConfigFinished")));
@property (readonly) NovaCoreEventHub<NovaCorePlayerConnectedEvent *> *playerConnected __attribute__((swift_name("playerConnected")));
@property (readonly) NovaCoreEventHub<NovaCorePlayerSwitchedEvent *> *playerSwitched __attribute__((swift_name("playerSwitched")));
@property (readonly) NovaCoreEventHub<NovaCoreShareFinishedEvent *> *shareFinished __attribute__((swift_name("shareFinished")));
@property (readonly) NovaCoreEventHub<NovaCoreTokenRefreshEvent *> *tokenRefresh __attribute__((swift_name("tokenRefresh")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("BaseGameKit")))
@interface NovaCoreBaseGameKit : NovaCoreBase
- (instancetype)initWithEngine:(id<NovaCoreEngineInterface>)engine __attribute__((swift_name("init(engine:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithEngine:(id<NovaCoreEngineInterface>)engine language:(NovaCoreLanguage *)language __attribute__((swift_name("init(engine:language:)"))) __attribute__((objc_designated_initializer));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> * _Nullable)accountDeletionAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("accountDeletion()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCorePlayer *> * _Nullable)connectPlatform:(NovaCorePlatform *)platform credentials:(NovaCorePlatformCredentials *)credentials error:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("connect(platform:credentials:)")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCoreKotlinArray<NovaCorePlatformConnectionInfo *> *> * _Nullable)fetchConnectedPlatformsAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("fetchConnectedPlatforms()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCoreKotlinArray<NovaCorePlatformConnectionInfo *> *> * _Nullable)fetchTotalConnectPlatformsAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("fetchTotalConnectPlatforms()")));
- (NSString *)getAdUnitIdAdUnitName:(NSString *)adUnitName adType:(NovaCoreAdType *)adType adMediation:(NovaCoreAdMediation *)adMediation __attribute__((swift_name("getAdUnitId(adUnitName:adType:adMediation:)")));
- (NSString *)getAgreementType:(NovaCoreAgreementType *)type __attribute__((swift_name("getAgreement(type:)")));
- (NovaCoreKotlinArray<NSString *> *)getAllAdUnitIdsAdType:(NovaCoreAdType *)adType adMediation:(NovaCoreAdMediation *)adMediation __attribute__((swift_name("getAllAdUnitIds(adType:adMediation:)")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCoreKotlinArray<NovaCoreLoginHistory *> *> * _Nullable)getHistoryAccountsAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("getHistoryAccounts()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> * _Nullable)doInitAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("doInit()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCorePlayer *> * _Nullable)loginIsSwitchEnforced:(BOOL)isSwitchEnforced error:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("login(isSwitchEnforced:)")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCorePlayer *> * _Nullable)loginForPlatformPlatform:(NovaCorePlatform *)platform credentials:(NovaCorePlatformCredentials *)credentials thirdUuid:(NSString *)thirdUuid error:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("loginForPlatform(platform:credentials:thirdUuid:)")));
- (void)onBecomeActive __attribute__((swift_name("onBecomeActive()")));
- (void)onEnterBack __attribute__((swift_name("onEnterBack()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCorePurchaseResult *> * _Nullable)purchaseProductId:(NSString *)productId extensionParam:(NSString *)extensionParam finishEvent:(NovaCorePurchaseEvent *)finishEvent error:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("purchase(productId:extensionParam:finishEvent:)")));
- (NSString *)replacePlaceholdersUrl:(NSString *)url extensionParam:(NSString *)extensionParam productId:(NSString *)productId productType:(NSString *)productType customPlaceholders:(NSDictionary<NSString *, NSString *> *)customPlaceholders __attribute__((swift_name("replacePlaceholders(url:extensionParam:productId:productType:customPlaceholders:)")));
- (NovaCorePromiseInterface<NovaCorePlayIntegrityStatus *> *)reportIntegrityTokenToken:(NSString *)token __attribute__((swift_name("reportIntegrityToken(token:)")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> * _Nullable)reportPrivacyAcceptanceAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("reportPrivacyAcceptance()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCoreBoolean *> * _Nullable)sendVerificationCodeEmail:(NSString *)email phone:(NSString *)phone codeType:(NovaCoreVerificationCodeType *)codeType error:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("sendVerificationCode(email:phone:codeType:)")));
- (void)setGameRoleRoleId:(NSString *)roleId roleName:(NSString *)roleName serverId:(NSString *)serverId serverName:(NSString *)serverName serverType:(NovaCoreServerType *)serverType level:(int32_t)level vipLevel:(int32_t)vipLevel coins:(int32_t)coins isFirstLogin:(BOOL)isFirstLogin __attribute__((swift_name("setGameRole(roleId:roleName:serverId:serverName:serverType:level:vipLevel:coins:isFirstLogin:)")));
- (NovaCorePromiseInterface<NovaCoreAdResult *> *)showAdCustomerAdUnitName:(NSString *)adUnitName adType:(NovaCoreAdType *)adType placement:(NSString *)placement extensionParam:(NSString *)extensionParam __attribute__((swift_name("showAdCustomer(adUnitName:adType:placement:extensionParam:)")));
- (void)showOfficial __attribute__((swift_name("showOfficial()")));
- (void)showOfficialRecharge __attribute__((swift_name("showOfficialRecharge()")));
- (void)showOrderDetails __attribute__((swift_name("showOrderDetails()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (NovaCorePromiseInterface<NovaCoreVerifyStatus *> * _Nullable)verifyOrderOrder:(NovaCorePayOrder *)order error:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("verifyOrder(order:)")));
@property (readonly) NovaCoreBackgroundEvents *backgroundEvents __attribute__((swift_name("backgroundEvents")));
@property (readonly) NovaCoreClientInfo *clientInfo __attribute__((swift_name("clientInfo")));
@property NovaCoreGameRole * _Nullable currentGameRole __attribute__((swift_name("currentGameRole")));
@property NovaCoreLanguage *currentLanguage __attribute__((swift_name("currentLanguage")));
@property NovaCorePlayer * _Nullable currentPlayer __attribute__((swift_name("currentPlayer")));
@property (readonly) id<NovaCoreEngineInterface> engine __attribute__((swift_name("engine")));
@property (readonly) NovaCoreGameTheme *gameTheme __attribute__((swift_name("gameTheme")));
@property BOOL isDebug __attribute__((swift_name("isDebug")));
@property NovaCoreRemoteGameConfig * _Nullable remoteGameConfig __attribute__((swift_name("remoteGameConfig")));
@property (readonly) NovaCoreTrackingKit *trackingKit __attribute__((swift_name("trackingKit")));
@end

__attribute__((swift_name("EngineInterface")))
@protocol NovaCoreEngineInterface
@required
- (void)adjustLogAdRevenueMediationName:(NSString *)mediationName price:(double)price currency:(NSString *)currency networkName:(NSString *)networkName networkPlacement:(NSString *)networkPlacement unitId:(NSString *)unitId customerDataStr:(NSString *)customerDataStr __attribute__((swift_name("adjustLogAdRevenue(mediationName:price:currency:networkName:networkPlacement:unitId:customerDataStr:)")));
- (void)adjustLogEventEventToken:(NSString *)eventToken params:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("adjustLogEvent(eventToken:params:)")));
- (void)adjustLogRevenueEventToken:(NSString *)eventToken price:(double)price currency:(NSString *)currency orderId:(NSString *)orderId __attribute__((swift_name("adjustLogRevenue(eventToken:price:currency:orderId:)")));
- (NovaCorePromiseInterface<NovaCoreAdResult *> *)didShowAdCustomerAdParams:(NovaCoreAdParams *)adParams customerData:(NSString *)customerData __attribute__((swift_name("didShowAdCustomer(adParams:customerData:)")));
- (void)facebookLogAdRevenuePrice:(double)price currency:(NSString *)currency __attribute__((swift_name("facebookLogAdRevenue(price:currency:)")));
- (void)facebookLogEventName:(NSString *)name params:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("facebookLogEvent(name:params:)")));
- (void)facebookLogRevenuePrice:(double)price currency:(NSString *)currency orderId:(NSString *)orderId __attribute__((swift_name("facebookLogRevenue(price:currency:orderId:)")));
- (void)firebaseLogEventName:(NSString *)name params:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("firebaseLogEvent(name:params:)")));
- (void)firebaseLogRevenuePrice:(double)price currency:(NSString *)currency orderId:(NSString *)orderId __attribute__((swift_name("firebaseLogRevenue(price:currency:orderId:)")));
- (id<NovaCoreDnsClientEngine>)getDnsClient __attribute__((swift_name("getDnsClient()")));
- (id<NovaCoreRestfulHttpEngine>)getHttpEngine __attribute__((swift_name("getHttpEngine()")));
- (id<NovaCoreTimerEngine>)getTimer __attribute__((swift_name("getTimer()")));
- (BOOL)isEnterBack __attribute__((swift_name("isEnterBack()")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promptAccountDeletionDeregister:(NovaCoreDeregister *)deregister __attribute__((swift_name("promptAccountDeletion(deregister:)")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promptDeviceBlockExpToken:(NSString *)expToken __attribute__((swift_name("promptDeviceBlock(expToken:)")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promptFrozenTipsInfo:(NovaCoreTipsInfo *)tipsInfo __attribute__((swift_name("promptFrozen(tipsInfo:)")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promptIDFA __attribute__((swift_name("promptIDFA()")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promptIPBlockExpToken:(NSString *)expToken __attribute__((swift_name("promptIPBlock(expToken:)")));
- (void)promptNetworkError __attribute__((swift_name("promptNetworkError()")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promptPlayerBlockExpToken:(NSString *)expToken __attribute__((swift_name("promptPlayerBlock(expToken:)")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promptPlayerTokenExpired __attribute__((swift_name("promptPlayerTokenExpired()")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promptRealNamePlayer:(NovaCorePlayer *)player type:(NovaCoreRegionalAgent *)type contentUrl:(NSString *)contentUrl __attribute__((swift_name("promptRealName(player:type:contentUrl:)")));
- (void)promptTpContent:(NSString *)content type:(NovaCoreBrowserType *)type __attribute__((swift_name("promptTp(content:type:)")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)showConfirmAgreementView __attribute__((swift_name("showConfirmAgreementView()")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)showConnectNoticeView __attribute__((swift_name("showConnectNoticeView()")));
- (NovaCorePromiseInterface<NovaCoreInt *> *)showDMAView __attribute__((swift_name("showDMAView()")));
- (NovaCorePromiseInterface<NovaCorePlayer *> *)showLoginHistoryLoginHistories:(NovaCoreKotlinArray<NovaCoreLoginHistory *> *)loginHistories __attribute__((swift_name("showLoginHistory(loginHistories:)")));
- (NovaCorePromiseInterface<NovaCorePlayer *> *)showLoginView __attribute__((swift_name("showLoginView()")));
- (NovaCorePromiseInterface<NovaCorePlayer *> *)showQuickLoginView __attribute__((swift_name("showQuickLoginView()")));
- (void)tdLogEventName:(NSString *)name params:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("tdLogEvent(name:params:)")));
- (void)tiktokLogEventName:(NSString *)name params:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("tiktokLogEvent(name:params:)")));
- (void)tiktokLogRevenueName:(NSString *)name price:(double)price currency:(NSString *)currency orderId:(NSString *)orderId __attribute__((swift_name("tiktokLogRevenue(name:price:currency:orderId:)")));
- (void)trackFirstEventName:(NSString *)name firstCheckId:(NSString *)firstCheckId params:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("trackFirstEvent(name:firstCheckId:params:)")));
- (void)trackLoginParams:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("trackLogin(params:)")));
- (void)trackUserAddParams:(NSDictionary<NSString *, id> *)params __attribute__((swift_name("trackUserAdd(params:)")));
- (void)trackUserSetGameRole:(NovaCoreGameRole *)gameRole __attribute__((swift_name("trackUserSet(gameRole:)")));
- (void)trackUserSetParams:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("trackUserSet(params:)")));
- (void)trackUserSetOnceParams:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("trackUserSetOnce(params:)")));
@property (readonly) id<NovaCoreMutableKVStorage> eventLogStorage __attribute__((swift_name("eventLogStorage")));
@property (readonly) id<NovaCoreReadonlyKVStorage> packageSettings __attribute__((swift_name("packageSettings")));
@property (readonly) id<NovaCorePaymentHandlerInterface> paymentHandler __attribute__((swift_name("paymentHandler")));
@property (readonly) id<NovaCoreMutableKVStorage> paymentOrderStorage __attribute__((swift_name("paymentOrderStorage")));
@property (readonly) id<NovaCoreMutableKVStorage> persistentStorage __attribute__((swift_name("persistentStorage")));
@property (readonly) id<NovaCoreMutableKVStorage> sessionStorage __attribute__((swift_name("sessionStorage")));
@property (readonly) id<NovaCoreToolFunctionInterface> toolFunctions __attribute__((swift_name("toolFunctions")));
@end

__attribute__((swift_name("EngineService")))
@interface NovaCoreEngineService : NovaCoreBase
- (instancetype)initWithHttpEngine:(id<NovaCoreRestfulHttpEngine>)httpEngine __attribute__((swift_name("init(httpEngine:)"))) __attribute__((objc_designated_initializer));
@property (readonly) NovaCoreHttpClient *httpClient __attribute__((swift_name("httpClient")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SdkReleaseInfo")))
@interface NovaCoreSdkReleaseInfo : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)sdkReleaseInfo __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreSdkReleaseInfo *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *SDK_RELEASE_DATE __attribute__((swift_name("SDK_RELEASE_DATE")));
@property (readonly) NSString *SDK_VERSION __attribute__((swift_name("SDK_VERSION")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("PlatformCredentials")))
@interface NovaCorePlatformCredentials : NovaCoreBase
@property (class, readonly, getter=companion) NovaCorePlatformCredentialsCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)serializer __attribute__((swift_name("serializer()")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property NSString *email __attribute__((swift_name("email")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property NSString *idToken __attribute__((swift_name("idToken")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property BOOL isLimit __attribute__((swift_name("isLimit")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property NSString *platformNickname __attribute__((swift_name("platformNickname")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property NSString *preservedLoginPlatform __attribute__((swift_name("preservedLoginPlatform")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property NSString *targetUuid __attribute__((swift_name("targetUuid")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property NSString *token __attribute__((swift_name("token")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property NSString *userId __attribute__((swift_name("userId")));

/**
 * @note annotations
 *   kotlinx.serialization.Transient
*/
@property NSString *verificationCode __attribute__((swift_name("verificationCode")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
 *   kotlinx.serialization.SerialName(value="AccessTokenVerifiedCredentials")
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AccessTokenVerifiedCredentials")))
@interface NovaCoreAccessTokenVerifiedCredentials : NovaCorePlatformCredentials
- (instancetype)initWithToken:(NSString *)token platformNickname:(NSString *)platformNickname targetUuid:(NSString *)targetUuid __attribute__((swift_name("init(token:platformNickname:targetUuid:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreAccessTokenVerifiedCredentialsCompanion *companion __attribute__((swift_name("companion")));
@property NSString *platformNickname __attribute__((swift_name("platformNickname")));
@property NSString *targetUuid __attribute__((swift_name("targetUuid")));
@property NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AccessTokenVerifiedCredentials.Companion")))
@interface NovaCoreAccessTokenVerifiedCredentialsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreAccessTokenVerifiedCredentialsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdCustomerData")))
@interface NovaCoreAdCustomerData : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithUnitId:(NSString *)unitId extensionParam:(NSString *)extensionParam __attribute__((swift_name("init(unitId:extensionParam:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreAdCustomerDataCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdCustomerData.Companion")))
@interface NovaCoreAdCustomerDataCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreAdCustomerDataCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((swift_name("KotlinComparable")))
@protocol NovaCoreKotlinComparable
@required
- (int32_t)compareToOther:(id _Nullable)other __attribute__((swift_name("compareTo(other:)")));
@end

__attribute__((swift_name("KotlinEnum")))
@interface NovaCoreKotlinEnum<E> : NovaCoreBase <NovaCoreKotlinComparable>
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreKotlinEnumCompanion *companion __attribute__((swift_name("companion")));
- (int32_t)compareToOther:(E)other __attribute__((swift_name("compareTo(other:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) int32_t ordinal __attribute__((swift_name("ordinal")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdErrorType")))
@interface NovaCoreAdErrorType : NovaCoreKotlinEnum<NovaCoreAdErrorType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreAdErrorType *noerror __attribute__((swift_name("noerror")));
@property (class, readonly) NovaCoreAdErrorType *internalerror __attribute__((swift_name("internalerror")));
@property (class, readonly) NovaCoreAdErrorType *dontsupportmediation __attribute__((swift_name("dontsupportmediation")));
@property (class, readonly) NovaCoreAdErrorType *dontsupportadtype __attribute__((swift_name("dontsupportadtype")));
@property (class, readonly) NovaCoreAdErrorType *needmoreinfo __attribute__((swift_name("needmoreinfo")));
@property (class, readonly) NovaCoreAdErrorType *limitaccess __attribute__((swift_name("limitaccess")));
@property (class, readonly) NovaCoreAdErrorType *notfoundunitid __attribute__((swift_name("notfoundunitid")));
@property (class, readonly) NovaCoreAdErrorType *sdknotinitialized __attribute__((swift_name("sdknotinitialized")));
@property (class, readonly) NovaCoreAdErrorType *mediationnotinitialized __attribute__((swift_name("mediationnotinitialized")));
@property (class, readonly) NovaCoreAdErrorType *adnotready __attribute__((swift_name("adnotready")));
@property (class, readonly) NovaCoreAdErrorType *adshowing __attribute__((swift_name("adshowing")));
@property (class, readonly) NovaCoreAdErrorType *mediationerror __attribute__((swift_name("mediationerror")));
+ (NovaCoreKotlinArray<NovaCoreAdErrorType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreAdErrorType *> *entries __attribute__((swift_name("entries")));
@property (readonly) int32_t code __attribute__((swift_name("code")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdEventInfo")))
@interface NovaCoreAdEventInfo : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMediation:(NovaCoreAdMediation *)mediation type:(NovaCoreAdType *)type unitId:(NSString *)unitId __attribute__((swift_name("init(mediation:type:unitId:)"))) __attribute__((objc_designated_initializer));
- (NSString *)description __attribute__((swift_name("description()")));
@property NSString *adNetworkName __attribute__((swift_name("adNetworkName")));
@property NSString *adNetworkPlacement __attribute__((swift_name("adNetworkPlacement")));
@property NSString *customerDataStr __attribute__((swift_name("customerDataStr")));
@property NSString *gamePlacement __attribute__((swift_name("gamePlacement")));
@property NovaCoreAdMediation *mediation __attribute__((swift_name("mediation")));
@property int64_t startTime __attribute__((swift_name("startTime")));
@property NovaCoreAdType *type __attribute__((swift_name("type")));
@property NSString *unitId __attribute__((swift_name("unitId")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdMediation")))
@interface NovaCoreAdMediation : NovaCoreKotlinEnum<NovaCoreAdMediation *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreAdMediationCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreAdMediation *admob __attribute__((swift_name("admob")));
@property (class, readonly) NovaCoreAdMediation *applovinMax __attribute__((swift_name("applovinMax")));
@property (class, readonly) NovaCoreAdMediation *ironSource __attribute__((swift_name("ironSource")));
@property (class, readonly) NovaCoreAdMediation *unknow __attribute__((swift_name("unknow")));
+ (NovaCoreKotlinArray<NovaCoreAdMediation *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreAdMediation *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *platform __attribute__((swift_name("platform")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdMediation.Companion")))
@interface NovaCoreAdMediationCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreAdMediationCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreAdMediation *)getEnumByValueNeedle:(NSString *)needle __attribute__((swift_name("getEnumByValue(needle:)")));
- (BOOL)hasValueNeedle:(NSString *)needle __attribute__((swift_name("hasValue(needle:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdOptionalParams")))
@interface NovaCoreAdOptionalParams : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithGameExtent:(NSString *)gameExtent __attribute__((swift_name("init(gameExtent:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreAdOptionalParamsCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)description __attribute__((swift_name("description()")));

/**
 * @note annotations
 *   kotlinx.serialization.Serializable(with=NormalClass(value=com/nova/core/service/NullableParametersSerializer))
 *   kotlinx.serialization.SerialName(value="gameExt")
*/
@property NSString * _Nullable gameExt __attribute__((swift_name("gameExt")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="packageName")
*/
@property NSString *packageName __attribute__((swift_name("packageName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdOptionalParams.Companion")))
@interface NovaCoreAdOptionalParamsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreAdOptionalParamsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdParams")))
@interface NovaCoreAdParams : NovaCoreBase
- (instancetype)initWithMediation:(NovaCoreAdMediation *)mediation type:(NovaCoreAdType *)type unitName:(NSString *)unitName unitId:(NSString *)unitId placement:(NSString *)placement __attribute__((swift_name("init(mediation:type:unitName:unitId:placement:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreAdParamsCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreAdParams *)doCopyMediation:(NovaCoreAdMediation *)mediation type:(NovaCoreAdType *)type unitName:(NSString *)unitName unitId:(NSString *)unitId placement:(NSString *)placement __attribute__((swift_name("doCopy(mediation:type:unitName:unitId:placement:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NovaCoreAdMediation *mediation __attribute__((swift_name("mediation")));
@property (readonly) NSString *placement __attribute__((swift_name("placement")));
@property (readonly) int64_t requestTime __attribute__((swift_name("requestTime")));
@property (readonly) NovaCoreAdType *type __attribute__((swift_name("type")));
@property (readonly) NSString *unitId __attribute__((swift_name("unitId")));
@property (readonly) NSString *unitName __attribute__((swift_name("unitName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdParams.Companion")))
@interface NovaCoreAdParamsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreAdParamsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdResult")))
@interface NovaCoreAdResult : NovaCoreBase
- (instancetype)initWithParams:(NovaCoreAdParams *)params __attribute__((swift_name("init(params:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreAdResultCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreAdResult *)doCopyParams:(NovaCoreAdParams *)params __attribute__((swift_name("doCopy(params:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property int32_t amount __attribute__((swift_name("amount")));
@property NSString *label __attribute__((swift_name("label")));
@property NSString *networkName __attribute__((swift_name("networkName")));
@property NSString *networkPlacement __attribute__((swift_name("networkPlacement")));
@property (readonly) NovaCoreAdParams *params __attribute__((swift_name("params")));
@property double revenue __attribute__((swift_name("revenue")));
@property NSString *revenuePrecision __attribute__((swift_name("revenuePrecision")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdResult.Companion")))
@interface NovaCoreAdResultCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreAdResultCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdType")))
@interface NovaCoreAdType : NovaCoreKotlinEnum<NovaCoreAdType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreAdType *rewarded __attribute__((swift_name("rewarded")));
@property (class, readonly) NovaCoreAdType *banner __attribute__((swift_name("banner")));
@property (class, readonly) NovaCoreAdType *interstitial __attribute__((swift_name("interstitial")));
@property (class, readonly) NovaCoreAdType *mrec __attribute__((swift_name("mrec")));
@property (class, readonly) NovaCoreAdType *native __attribute__((swift_name("native")));
@property (class, readonly) NovaCoreAdType *appopen __attribute__((swift_name("appopen")));
@property (class, readonly) NovaCoreAdType *interstitialRewarded __attribute__((swift_name("interstitialRewarded")));
+ (NovaCoreKotlinArray<NovaCoreAdType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreAdType *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AgreementType")))
@interface NovaCoreAgreementType : NovaCoreKotlinEnum<NovaCoreAgreementType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreAgreementType *privacyAgreement __attribute__((swift_name("privacyAgreement")));
@property (class, readonly) NovaCoreAgreementType *userAgreement __attribute__((swift_name("userAgreement")));
@property (class, readonly) NovaCoreAgreementType *subscriptionAgreement __attribute__((swift_name("subscriptionAgreement")));
@property (class, readonly) NovaCoreAgreementType *deregisterAgreement __attribute__((swift_name("deregisterAgreement")));
+ (NovaCoreKotlinArray<NovaCoreAgreementType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreAgreementType *> *entries __attribute__((swift_name("entries")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
 *   kotlinx.serialization.SerialName(value="AppleVerifiedCredentials")
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppleVerifiedCredentials")))
@interface NovaCoreAppleVerifiedCredentials : NovaCorePlatformCredentials
- (instancetype)initWithIdToken:(NSString *)idToken platformNickname:(NSString *)platformNickname targetUuid:(NSString *)targetUuid __attribute__((swift_name("init(idToken:platformNickname:targetUuid:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreAppleVerifiedCredentialsCompanion *companion __attribute__((swift_name("companion")));
@property NSString *idToken __attribute__((swift_name("idToken")));
@property NSString *platformNickname __attribute__((swift_name("platformNickname")));
@property NSString *targetUuid __attribute__((swift_name("targetUuid")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppleVerifiedCredentials.Companion")))
@interface NovaCoreAppleVerifiedCredentialsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreAppleVerifiedCredentialsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("BrowserType")))
@interface NovaCoreBrowserType : NovaCoreKotlinEnum<NovaCoreBrowserType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreBrowserTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreBrowserType *browser __attribute__((swift_name("browser")));
@property (class, readonly) NovaCoreBrowserType *customer __attribute__((swift_name("customer")));
+ (NovaCoreKotlinArray<NovaCoreBrowserType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreBrowserType *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("BrowserType.Companion")))
@interface NovaCoreBrowserTypeCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreBrowserTypeCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreBrowserType *)getEnumByValueType:(int32_t)type __attribute__((swift_name("getEnumByValue(type:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ClientInfo")))
@interface NovaCoreClientInfo : NovaCoreBase
- (instancetype)initWithGameCode:(NSString *)gameCode sCode:(NSString *)sCode deviceId:(NSString *)deviceId packageName:(NSString *)packageName sdkVersion:(NSString *)sdkVersion os:(NSString *)os osVersion:(NSString *)osVersion idfa:(NSString *)idfa idfv:(NSString *)idfv deviceModel:(NSString *)deviceModel deviceBrand:(NSString *)deviceBrand clientVersion:(NSString *)clientVersion clientBuildVersion:(NSString *)clientBuildVersion gameLanguage:(NSString *)gameLanguage adid:(NSString *)adid regionCode:(NSString *)regionCode sfCode:(NSString *)sfCode __attribute__((swift_name("init(gameCode:sCode:deviceId:packageName:sdkVersion:os:osVersion:idfa:idfv:deviceModel:deviceBrand:clientVersion:clientBuildVersion:gameLanguage:adid:regionCode:sfCode:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreClientInfoCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreClientInfo *)doCopyGameCode:(NSString *)gameCode sCode:(NSString *)sCode deviceId:(NSString *)deviceId packageName:(NSString *)packageName sdkVersion:(NSString *)sdkVersion os:(NSString *)os osVersion:(NSString *)osVersion idfa:(NSString *)idfa idfv:(NSString *)idfv deviceModel:(NSString *)deviceModel deviceBrand:(NSString *)deviceBrand clientVersion:(NSString *)clientVersion clientBuildVersion:(NSString *)clientBuildVersion gameLanguage:(NSString *)gameLanguage adid:(NSString *)adid regionCode:(NSString *)regionCode sfCode:(NSString *)sfCode __attribute__((swift_name("doCopy(gameCode:sCode:deviceId:packageName:sdkVersion:os:osVersion:idfa:idfv:deviceModel:deviceBrand:clientVersion:clientBuildVersion:gameLanguage:adid:regionCode:sfCode:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSDictionary<NSString *, NSString *> *)map __attribute__((swift_name("map()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NSString *adid __attribute__((swift_name("adid")));
@property (readonly) NSString *clientBuildVersion __attribute__((swift_name("clientBuildVersion")));
@property (readonly) NSString *clientVersion __attribute__((swift_name("clientVersion")));
@property NSString *country __attribute__((swift_name("country")));
@property (readonly) NSString *deviceBrand __attribute__((swift_name("deviceBrand")));
@property (readonly) NSString *deviceId __attribute__((swift_name("deviceId")));
@property (readonly) NSString *deviceModel __attribute__((swift_name("deviceModel")));
@property (readonly) NSString *gameCode __attribute__((swift_name("gameCode")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="gameLang")
*/
@property NSString *gameLanguage __attribute__((swift_name("gameLanguage")));
@property NSString *idfa __attribute__((swift_name("idfa")));
@property (readonly) NSString *idfv __attribute__((swift_name("idfv")));
@property (readonly) NSString *os __attribute__((swift_name("os")));
@property (readonly) NSString *osVersion __attribute__((swift_name("osVersion")));
@property (readonly) NSString *packageName __attribute__((swift_name("packageName")));
@property NSString *regionCode __attribute__((swift_name("regionCode")));
@property (readonly) NSString *sCode __attribute__((swift_name("sCode")));
@property (readonly) NSString *sdkVersion __attribute__((swift_name("sdkVersion")));
@property (readonly) NSString *serialized __attribute__((swift_name("serialized")));
@property NSString *sfCode __attribute__((swift_name("sfCode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ClientInfo.Companion")))
@interface NovaCoreClientInfoCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreClientInfoCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreClientInfo *)default __attribute__((swift_name("default()")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((swift_name("Color")))
@interface NovaCoreColor : NovaCoreBase
- (instancetype)initWithLittleTitleColor:(NSString *)littleTitleColor highlightLittleTitleColor:(NSString *)highlightLittleTitleColor descriptionTitleColor:(NSString *)descriptionTitleColor textFieldBorderColor:(NSString *)textFieldBorderColor focusTextFieldBorderColor:(NSString *)focusTextFieldBorderColor splitLineBackgroundColor:(NSString *)splitLineBackgroundColor __attribute__((swift_name("init(littleTitleColor:highlightLittleTitleColor:descriptionTitleColor:textFieldBorderColor:focusTextFieldBorderColor:splitLineBackgroundColor:)"))) __attribute__((objc_designated_initializer));
- (NSString * _Nullable)trimBlankString:(NSString * _Nullable)string __attribute__((swift_name("trimBlank(string:)")));
@property NSString *backgroundColor __attribute__((swift_name("backgroundColor")));
@property NSString *buttonBackgroundColor __attribute__((swift_name("buttonBackgroundColor")));
@property NSString *buttonHighlightBackgroundColor __attribute__((swift_name("buttonHighlightBackgroundColor")));
@property NSString *contentBackgroundColor __attribute__((swift_name("contentBackgroundColor")));
@property (readonly) NSString *descriptionTitleColor __attribute__((swift_name("descriptionTitleColor")));
@property (readonly) NSString *focusTextFieldBorderColor __attribute__((swift_name("focusTextFieldBorderColor")));
@property NSString *highlightBackgroundColor __attribute__((swift_name("highlightBackgroundColor")));
@property (readonly) NSString *highlightLittleTitleColor __attribute__((swift_name("highlightLittleTitleColor")));
@property (readonly) NSString *littleTitleColor __attribute__((swift_name("littleTitleColor")));
@property (readonly) NSString *splitLineBackgroundColor __attribute__((swift_name("splitLineBackgroundColor")));
@property NSString *textButtonTitleColor __attribute__((swift_name("textButtonTitleColor")));
@property (readonly) NSString *textFieldBorderColor __attribute__((swift_name("textFieldBorderColor")));
@property NSString *titleColor __attribute__((swift_name("titleColor")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ConnectPlatform")))
@interface NovaCoreConnectPlatform : NovaCoreKotlinEnum<NovaCoreConnectPlatform *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreConnectPlatformCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreConnectPlatform *all __attribute__((swift_name("all")));
@property (class, readonly) NovaCoreConnectPlatform *email __attribute__((swift_name("email")));
@property (class, readonly) NovaCoreConnectPlatform *facebook __attribute__((swift_name("facebook")));
@property (class, readonly) NovaCoreConnectPlatform *apple __attribute__((swift_name("apple")));
@property (class, readonly) NovaCoreConnectPlatform *google __attribute__((swift_name("google")));
@property (class, readonly) NovaCoreConnectPlatform *line __attribute__((swift_name("line")));
@property (class, readonly) NovaCoreConnectPlatform *kakao __attribute__((swift_name("kakao")));
@property (class, readonly) NovaCoreConnectPlatform *vk __attribute__((swift_name("vk")));
+ (NovaCoreKotlinArray<NovaCoreConnectPlatform *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreConnectPlatform *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *platform __attribute__((swift_name("platform")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ConnectPlatform.Companion")))
@interface NovaCoreConnectPlatformCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreConnectPlatformCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreConnectPlatform *)getEnumByValueNeedle:(NSString *)needle default:(NovaCoreConnectPlatform *)default_ __attribute__((swift_name("getEnumByValue(needle:default:)")));
@end

__attribute__((swift_name("CredentialSerializerProvider")))
@protocol NovaCoreCredentialSerializerProvider
@required
- (NovaCoreKotlinx_serialization_coreSerializersModule *)provideSerializerForCredentialsClass:(id<NovaCoreKotlinKClass>)credentialsClass __attribute__((swift_name("provideSerializerFor(credentialsClass:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DarkColor")))
@interface NovaCoreDarkColor : NovaCoreColor
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithLittleTitleColor:(NSString *)littleTitleColor highlightLittleTitleColor:(NSString *)highlightLittleTitleColor descriptionTitleColor:(NSString *)descriptionTitleColor textFieldBorderColor:(NSString *)textFieldBorderColor focusTextFieldBorderColor:(NSString *)focusTextFieldBorderColor splitLineBackgroundColor:(NSString *)splitLineBackgroundColor __attribute__((swift_name("init(littleTitleColor:highlightLittleTitleColor:descriptionTitleColor:textFieldBorderColor:focusTextFieldBorderColor:splitLineBackgroundColor:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property NSString *backgroundColor __attribute__((swift_name("backgroundColor")));
@property NSString *buttonBackgroundColor __attribute__((swift_name("buttonBackgroundColor")));
@property NSString *buttonHighlightBackgroundColor __attribute__((swift_name("buttonHighlightBackgroundColor")));
@property NSString *contentBackgroundColor __attribute__((swift_name("contentBackgroundColor")));
@property NSString *highlightBackgroundColor __attribute__((swift_name("highlightBackgroundColor")));
@property NSString *textButtonTitleColor __attribute__((swift_name("textButtonTitleColor")));
@property NSString *titleColor __attribute__((swift_name("titleColor")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DefaultCredentialSerializerProvider")))
@interface NovaCoreDefaultCredentialSerializerProvider : NovaCoreBase <NovaCoreCredentialSerializerProvider>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (NovaCoreKotlinx_serialization_coreSerializersModule *)provideSerializerForCredentialsClass:(id<NovaCoreKotlinKClass>)credentialsClass __attribute__((swift_name("provideSerializerFor(credentialsClass:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Deregister")))
@interface NovaCoreDeregister : NovaCoreBase
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithStatus:(BOOL)status submitTime:(int32_t)submitTime applyDeregisterTime:(int32_t)applyDeregisterTime __attribute__((swift_name("init(status:submitTime:applyDeregisterTime:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreDeregisterCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreDeregister *)doCopyStatus:(BOOL)status submitTime:(int32_t)submitTime applyDeregisterTime:(int32_t)applyDeregisterTime __attribute__((swift_name("doCopy(status:submitTime:applyDeregisterTime:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="applyDeregisterTime")
*/
@property int32_t applyDeregisterTime __attribute__((swift_name("applyDeregisterTime")));
@property BOOL shouldRepay __attribute__((swift_name("shouldRepay")));
@property BOOL shouldUnsubscribe __attribute__((swift_name("shouldUnsubscribe")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="submitStatus")
*/
@property BOOL status __attribute__((swift_name("status")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="submitTime")
*/
@property int32_t submitTime __attribute__((swift_name("submitTime")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Deregister.Companion")))
@interface NovaCoreDeregisterCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreDeregisterCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
 *   kotlinx.serialization.SerialName(value="DeviceVerifiedCredentials")
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DeviceVerifiedCredentials")))
@interface NovaCoreDeviceVerifiedCredentials : NovaCorePlatformCredentials
- (instancetype)initWithTargetUuid:(NSString *)targetUuid __attribute__((swift_name("init(targetUuid:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreDeviceVerifiedCredentialsCompanion *companion __attribute__((swift_name("companion")));
@property NSString *targetUuid __attribute__((swift_name("targetUuid")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DeviceVerifiedCredentials.Companion")))
@interface NovaCoreDeviceVerifiedCredentialsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreDeviceVerifiedCredentialsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DnsRecord")))
@interface NovaCoreDnsRecord : NovaCoreBase
- (instancetype)initWithHostname:(NSString *)hostname ip:(NSString *)ip timestamp:(int32_t)timestamp __attribute__((swift_name("init(hostname:ip:timestamp:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreDnsRecordCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *hostname __attribute__((swift_name("hostname")));
@property (readonly) NSString *ip __attribute__((swift_name("ip")));
@property (readonly) int32_t timestamp __attribute__((swift_name("timestamp")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DnsRecord.Companion")))
@interface NovaCoreDnsRecordCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreDnsRecordCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
 *   kotlinx.serialization.SerialName(value="EmailCodeCredentials")
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("EmailCodeCredentials")))
@interface NovaCoreEmailCodeCredentials : NovaCorePlatformCredentials
- (instancetype)initWithEmail:(NSString *)email verificationCode:(NSString *)verificationCode targetUuid:(NSString *)targetUuid __attribute__((swift_name("init(email:verificationCode:targetUuid:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreEmailCodeCredentialsCompanion *companion __attribute__((swift_name("companion")));
@property NSString *email __attribute__((swift_name("email")));
@property NSString *targetUuid __attribute__((swift_name("targetUuid")));
@property NSString *verificationCode __attribute__((swift_name("verificationCode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("EmailCodeCredentials.Companion")))
@interface NovaCoreEmailCodeCredentialsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreEmailCodeCredentialsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((swift_name("GameConfigBase")))
@interface NovaCoreGameConfigBase : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GamePlayer")))
@interface NovaCoreGamePlayer : NovaCoreBase
- (instancetype)initWithPlayerId:(NSString *)playerId platform:(NovaCoreRevealedPlatform *)platform playerToken:(NSString *)playerToken isFirstLogin:(BOOL)isFirstLogin __attribute__((swift_name("init(playerId:platform:playerToken:isFirstLogin:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreGamePlayerCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreGamePlayer *)doCopyPlayerId:(NSString *)playerId platform:(NovaCoreRevealedPlatform *)platform playerToken:(NSString *)playerToken isFirstLogin:(BOOL)isFirstLogin __attribute__((swift_name("doCopy(playerId:platform:playerToken:isFirstLogin:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *deviceId __attribute__((swift_name("deviceId")));
@property BOOL isFirstLogin __attribute__((swift_name("isFirstLogin")));
@property (readonly) NovaCoreRevealedPlatform *platform __attribute__((swift_name("platform")));
@property (readonly) NSString *playerId __attribute__((swift_name("playerId")));
@property (readonly) NSString *playerToken __attribute__((swift_name("playerToken")));
@property (readonly) NSString *serialized __attribute__((swift_name("serialized")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GamePlayer.Companion")))
@interface NovaCoreGamePlayerCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreGamePlayerCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("GameRole")))
@interface NovaCoreGameRole : NovaCoreBase
- (instancetype)initWithEle:(NovaCoreKotlinx_serialization_jsonJsonElement *)ele __attribute__((swift_name("init(ele:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithRoleId:(NSString *)roleId serverId:(NSString *)serverId __attribute__((swift_name("init(roleId:serverId:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithSeen0:(int32_t)seen0 roleId:(NSString * _Nullable)roleId serverId:(NSString * _Nullable)serverId roleName:(NSString * _Nullable)roleName level:(int32_t)level vipLevel:(int32_t)vipLevel coins:(int32_t)coins serverName:(NSString * _Nullable)serverName serverType:(NovaCoreServerType * _Nullable)serverType serverPlatform:(NSString * _Nullable)serverPlatform isFirstLogin:(BOOL)isFirstLogin serializationConstructorMarker:(id _Nullable)serializationConstructorMarker __attribute__((swift_name("init(seen0:roleId:serverId:roleName:level:vipLevel:coins:serverName:serverType:serverPlatform:isFirstLogin:serializationConstructorMarker:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreGameRoleCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreGameRole *)deepCopy __attribute__((swift_name("deepCopy()")));
- (void)reset __attribute__((swift_name("reset()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property int32_t coins __attribute__((swift_name("coins")));
@property (readonly) BOOL isAvailable __attribute__((swift_name("isAvailable")));
@property BOOL isFirstLogin __attribute__((swift_name("isFirstLogin")));
@property int32_t level __attribute__((swift_name("level")));
@property NSString *roleId __attribute__((swift_name("roleId")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="name")
*/
@property NSString *roleName __attribute__((swift_name("roleName")));
@property (readonly) NSString *serialized __attribute__((swift_name("serialized")));
@property NSString *serverId __attribute__((swift_name("serverId")));
@property NSString *serverName __attribute__((swift_name("serverName")));
@property NSString *serverPlatform __attribute__((swift_name("serverPlatform")));
@property NovaCoreServerType *serverType __attribute__((swift_name("serverType")));
@property int32_t vipLevel __attribute__((swift_name("vipLevel")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GameRole.Companion")))
@interface NovaCoreGameRoleCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreGameRoleCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GameTheme")))
@interface NovaCoreGameTheme : NovaCoreBase
- (instancetype)initWithGameThemeBase:(NovaCoreGameThemeBase *)gameThemeBase __attribute__((swift_name("init(gameThemeBase:)"))) __attribute__((objc_designated_initializer));
@property NovaCoreThemeBorderTextField *borderTextField __attribute__((swift_name("borderTextField")));
@property NovaCoreThemeButton *button __attribute__((swift_name("button")));
@property NovaCoreThemeCell *cell __attribute__((swift_name("cell")));
@property float contentViewAlpha __attribute__((swift_name("contentViewAlpha")));
@property NovaCoreThemeColor *contentViewBackgroundColor __attribute__((swift_name("contentViewBackgroundColor")));
@property NovaCoreThemeTitle *descriptionTitle __attribute__((swift_name("descriptionTitle")));
@property NovaCoreThemeTitle *headline __attribute__((swift_name("headline")));
@property NovaCoreThemeTitle *littleDescriptionTitle __attribute__((swift_name("littleDescriptionTitle")));
@property NovaCoreThemeTitle *littleTitle __attribute__((swift_name("littleTitle")));
@property NovaCoreThemeColor *mainViewBackgroundColor __attribute__((swift_name("mainViewBackgroundColor")));
@property NovaCoreThemeLine *splitLine __attribute__((swift_name("splitLine")));
@property NovaCoreThemeTitle *textButton __attribute__((swift_name("textButton")));
@property NovaCoreThemeTitle *title __attribute__((swift_name("title")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GameThemeBase")))
@interface NovaCoreGameThemeBase : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element theme:(NovaCoreTheme *)theme __attribute__((swift_name("init(element:theme:)"))) __attribute__((objc_designated_initializer));
@property NovaCoreTheme *appearance __attribute__((swift_name("appearance")));
@property (readonly) NovaCoreColor *display __attribute__((swift_name("display")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IntegrityConfig")))
@interface NovaCoreIntegrityConfig : NovaCoreBase
- (instancetype)initWithInterval:(int32_t)interval __attribute__((swift_name("init(interval:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreIntegrityConfigCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreIntegrityConfig *)doCopyInterval:(int32_t)interval __attribute__((swift_name("doCopy(interval:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NSString *deviceHash __attribute__((swift_name("deviceHash")));
@property int32_t interval __attribute__((swift_name("interval")));
@property BOOL isAllowed __attribute__((swift_name("isAllowed")));
@property BOOL isHandlerError __attribute__((swift_name("isHandlerError")));
@property BOOL isHandlerPrepareError __attribute__((swift_name("isHandlerPrepareError")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IntegrityConfig.Companion")))
@interface NovaCoreIntegrityConfigCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreIntegrityConfigCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LightColor")))
@interface NovaCoreLightColor : NovaCoreColor
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithLittleTitleColor:(NSString *)littleTitleColor highlightLittleTitleColor:(NSString *)highlightLittleTitleColor descriptionTitleColor:(NSString *)descriptionTitleColor textFieldBorderColor:(NSString *)textFieldBorderColor focusTextFieldBorderColor:(NSString *)focusTextFieldBorderColor splitLineBackgroundColor:(NSString *)splitLineBackgroundColor __attribute__((swift_name("init(littleTitleColor:highlightLittleTitleColor:descriptionTitleColor:textFieldBorderColor:focusTextFieldBorderColor:splitLineBackgroundColor:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property NSString *backgroundColor __attribute__((swift_name("backgroundColor")));
@property NSString *buttonBackgroundColor __attribute__((swift_name("buttonBackgroundColor")));
@property NSString *buttonHighlightBackgroundColor __attribute__((swift_name("buttonHighlightBackgroundColor")));
@property NSString *contentBackgroundColor __attribute__((swift_name("contentBackgroundColor")));
@property NSString *highlightBackgroundColor __attribute__((swift_name("highlightBackgroundColor")));
@property NSString *textButtonTitleColor __attribute__((swift_name("textButtonTitleColor")));
@property NSString *titleColor __attribute__((swift_name("titleColor")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
 *   kotlinx.serialization.SerialName(value="LimitTokenVerifiedCredentials")
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LimitTokenVerifiedCredentials")))
@interface NovaCoreLimitTokenVerifiedCredentials : NovaCorePlatformCredentials
- (instancetype)initWithToken:(NSString *)token platformNickname:(NSString *)platformNickname userId:(NSString *)userId isLimit:(BOOL)isLimit targetUuid:(NSString *)targetUuid __attribute__((swift_name("init(token:platformNickname:userId:isLimit:targetUuid:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreLimitTokenVerifiedCredentialsCompanion *companion __attribute__((swift_name("companion")));
@property BOOL isLimit __attribute__((swift_name("isLimit")));
@property NSString *platformNickname __attribute__((swift_name("platformNickname")));
@property NSString *targetUuid __attribute__((swift_name("targetUuid")));
@property NSString *token __attribute__((swift_name("token")));
@property NSString *userId __attribute__((swift_name("userId")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LimitTokenVerifiedCredentials.Companion")))
@interface NovaCoreLimitTokenVerifiedCredentialsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreLimitTokenVerifiedCredentialsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LocalGameConfig")))
@interface NovaCoreLocalGameConfig : NovaCoreGameConfigBase
- (instancetype)initWithIsSandbox:(BOOL)isSandbox lang:(NovaCoreLanguage *)lang __attribute__((swift_name("init(isSandbox:lang:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
@property NovaCoreBoolean * _Nullable enableSandboxLogCollect __attribute__((swift_name("enableSandboxLogCollect")));
@property (readonly) BOOL isSandbox __attribute__((swift_name("isSandbox")));
@property (readonly) NovaCoreLanguage *lang __attribute__((swift_name("lang")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LoginHistory")))
@interface NovaCoreLoginHistory : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPlatform:(NovaCoreRevealedPlatform *)platform __attribute__((swift_name("init(platform:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithEle:(NovaCoreKotlinx_serialization_jsonJsonElement *)ele __attribute__((swift_name("init(ele:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreLoginHistoryCompanion *companion __attribute__((swift_name("companion")));
- (BOOL)needsUserInteraction __attribute__((swift_name("needsUserInteraction()")));
@property NSString *deviceId __attribute__((swift_name("deviceId")));
@property NSArray<NovaCoreGameRole *> *gameRoles __attribute__((swift_name("gameRoles")));
@property NSString *lastLoginTime __attribute__((swift_name("lastLoginTime")));
@property NSString *nickname __attribute__((swift_name("nickname")));
@property NovaCoreRevealedPlatform *platform __attribute__((swift_name("platform")));
@property NSString *playerId __attribute__((swift_name("playerId")));
@property NSString *uuid __attribute__((swift_name("uuid")));
@property NSArray<NovaCoreVerifiablePlatform *> *verifiablePlatforms __attribute__((swift_name("verifiablePlatforms")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LoginHistory.Companion")))
@interface NovaCoreLoginHistoryCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreLoginHistoryCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Message")))
@interface NovaCoreMessage : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithJsonString:(NSString *)jsonString __attribute__((swift_name("init(jsonString:)"))) __attribute__((objc_designated_initializer));
@property NSString *link __attribute__((swift_name("link")));
@property NovaCoreMessageHandler *messageHandler __attribute__((swift_name("messageHandler")));
@property NovaCoreMessageType *messageType __attribute__((swift_name("messageType")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MessageHandler")))
@interface NovaCoreMessageHandler : NovaCoreKotlinEnum<NovaCoreMessageHandler *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreMessageHandlerCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreMessageHandler *game __attribute__((swift_name("game")));
@property (class, readonly) NovaCoreMessageHandler *sdk __attribute__((swift_name("sdk")));
+ (NovaCoreKotlinArray<NovaCoreMessageHandler *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreMessageHandler *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MessageHandler.Companion")))
@interface NovaCoreMessageHandlerCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreMessageHandlerCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreMessageHandler *)getHandlerByValueNeedle:(NSString *)needle __attribute__((swift_name("getHandlerByValue(needle:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MessageType")))
@interface NovaCoreMessageType : NovaCoreKotlinEnum<NovaCoreMessageType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreMessageTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreMessageType *disc __attribute__((swift_name("disc")));
@property (class, readonly) NovaCoreMessageType *wp __attribute__((swift_name("wp")));
+ (NovaCoreKotlinArray<NovaCoreMessageType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreMessageType *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MessageType.Companion")))
@interface NovaCoreMessageTypeCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreMessageTypeCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreMessageType *)getMessageTypeByValueNeedle:(NSString *)needle __attribute__((swift_name("getMessageTypeByValue(needle:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OnlineData")))
@interface NovaCoreOnlineData : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPlayerId:(NSString *)playerId gameRole:(NovaCoreGameRole *)gameRole __attribute__((swift_name("init(playerId:gameRole:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreOnlineDataCompanion *companion __attribute__((swift_name("companion")));
- (void)clear __attribute__((swift_name("clear()")));
- (void)recording __attribute__((swift_name("recording()")));
- (void)refresh __attribute__((swift_name("refresh()")));
- (void)resetTime __attribute__((swift_name("resetTime()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) BOOL isInvalid __attribute__((swift_name("isInvalid")));
@property int32_t level __attribute__((swift_name("level")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="online_time")
*/
@property int32_t onlineDuration __attribute__((swift_name("onlineDuration")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="player_id")
*/
@property NSString *playerId __attribute__((swift_name("playerId")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="record_time")
*/
@property int32_t recordTime __attribute__((swift_name("recordTime")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="role_id")
*/
@property NSString *roleId __attribute__((swift_name("roleId")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="server_id")
*/
@property NSString *serverId __attribute__((swift_name("serverId")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="server_type")
*/
@property NovaCoreServerType *serverType __attribute__((swift_name("serverType")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="vip_level")
*/
@property int32_t vipLevel __attribute__((swift_name("vipLevel")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OnlineData.Companion")))
@interface NovaCoreOnlineDataCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreOnlineDataCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Platform")))
@interface NovaCorePlatform : NovaCoreKotlinEnum<NovaCorePlatform *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCorePlatformCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCorePlatform *device __attribute__((swift_name("device")));
@property (class, readonly) NovaCorePlatform *email __attribute__((swift_name("email")));
@property (class, readonly) NovaCorePlatform *phone __attribute__((swift_name("phone")));
@property (class, readonly) NovaCorePlatform *facebook __attribute__((swift_name("facebook")));
@property (class, readonly) NovaCorePlatform *apple __attribute__((swift_name("apple")));
@property (class, readonly) NovaCorePlatform *google __attribute__((swift_name("google")));
@property (class, readonly) NovaCorePlatform *line __attribute__((swift_name("line")));
@property (class, readonly) NovaCorePlatform *gameCenter __attribute__((swift_name("gameCenter")));
@property (class, readonly) NovaCorePlatform *vk __attribute__((swift_name("vk")));
@property (class, readonly) NovaCorePlatform *kakao __attribute__((swift_name("kakao")));
@property (class, readonly) NovaCorePlatform *whatsapp __attribute__((swift_name("whatsapp")));
@property (class, readonly) NovaCorePlatform *twitter __attribute__((swift_name("twitter")));
@property (class, readonly) NovaCorePlatform *token __attribute__((swift_name("token")));
@property (class, readonly) NovaCorePlatform *refreshToken __attribute__((swift_name("refreshToken")));
@property (class, readonly) NovaCorePlatform *registration __attribute__((swift_name("registration")));
@property (class, readonly) NovaCorePlatform *verificationCode __attribute__((swift_name("verificationCode")));
@property (class, readonly) NovaCorePlatform *unknown __attribute__((swift_name("unknown")));
+ (NovaCoreKotlinArray<NovaCorePlatform *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePlatform *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *platform __attribute__((swift_name("platform")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Platform.Companion")))
@interface NovaCorePlatformCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePlatformCompanion *shared __attribute__((swift_name("shared")));
- (NovaCorePlatform *)getEnumByValuePlatform:(NSString *)platform __attribute__((swift_name("getEnumByValue(platform:)")));
- (NovaCorePlatform *)getEnumFromRevealedPlatformItem:(NovaCoreRevealedPlatform *)item __attribute__((swift_name("getEnumFromRevealedPlatform(item:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlatformConnectionInfo")))
@interface NovaCorePlatformConnectionInfo : NovaCoreBase
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithUuid:(NSString *)uuid nickname:(NSString *)nickname platform:(NovaCoreRevealedPlatform *)platform __attribute__((swift_name("init(uuid:nickname:platform:)"))) __attribute__((objc_designated_initializer));
- (NovaCorePlatformConnectionInfo *)doCopyUuid:(NSString *)uuid nickname:(NSString *)nickname platform:(NovaCoreRevealedPlatform *)platform __attribute__((swift_name("doCopy(uuid:nickname:platform:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NSString *nickname __attribute__((swift_name("nickname")));
@property NovaCoreRevealedPlatform *platform __attribute__((swift_name("platform")));
@property NSString *uuid __attribute__((swift_name("uuid")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlatformCredentials.Companion")))
@interface NovaCorePlatformCredentialsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePlatformCredentialsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(NovaCoreKotlinArray<id<NovaCoreKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
- (NSString *)translateJsonOriginString:(NSString *)originString __attribute__((swift_name("translateJson(originString:)")));
@property (readonly) NovaCoreKotlinx_serialization_coreSerializersModule *serialModule __attribute__((swift_name("serialModule")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayIntegrityStatus")))
@interface NovaCorePlayIntegrityStatus : NovaCoreKotlinEnum<NovaCorePlayIntegrityStatus *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCorePlayIntegrityStatus *normal __attribute__((swift_name("normal")));
@property (class, readonly) NovaCorePlayIntegrityStatus *googleApiException __attribute__((swift_name("googleApiException")));
@property (class, readonly) NovaCorePlayIntegrityStatus *unrecognizedVersion __attribute__((swift_name("unrecognizedVersion")));
@property (class, readonly) NovaCorePlayIntegrityStatus *unevaluated __attribute__((swift_name("unevaluated")));
@property (class, readonly) NovaCorePlayIntegrityStatus *sdkServerError __attribute__((swift_name("sdkServerError")));
@property (class, readonly) NovaCorePlayIntegrityStatus *unknownError __attribute__((swift_name("unknownError")));
+ (NovaCoreKotlinArray<NovaCorePlayIntegrityStatus *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePlayIntegrityStatus *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *status __attribute__((swift_name("status")));
@property (readonly) int32_t value __attribute__((swift_name("value")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Player")))
@interface NovaCorePlayer : NovaCoreBase
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPlayerId:(NSString *)playerId uuid:(NSString *)uuid platform:(NovaCoreRevealedPlatform *)platform __attribute__((swift_name("init(playerId:uuid:platform:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCorePlayerCompanion *companion __attribute__((swift_name("companion")));
- (NovaCorePlayer *)doCopyPlayerId:(NSString *)playerId uuid:(NSString *)uuid platform:(NovaCoreRevealedPlatform *)platform __attribute__((swift_name("doCopy(playerId:uuid:platform:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString * _Nullable email __attribute__((swift_name("email")));
@property BOOL hasAcceptProtocol __attribute__((swift_name("hasAcceptProtocol")));
@property (readonly) BOOL isExpired __attribute__((swift_name("isExpired")));
@property BOOL isFirstLogin __attribute__((swift_name("isFirstLogin")));
@property (readonly) BOOL isInvalid __attribute__((swift_name("isInvalid")));
@property (readonly) BOOL isRealNameAuthed __attribute__((swift_name("isRealNameAuthed")));
@property int32_t lastActiveTime __attribute__((swift_name("lastActiveTime")));
@property NovaCoreRevealedPlatform *platform __attribute__((swift_name("platform")));
@property NSString *playerId __attribute__((swift_name("playerId")));
@property (readonly) NSString *playerToken __attribute__((swift_name("playerToken")));
@property (readonly) int32_t playerTokenExp __attribute__((swift_name("playerTokenExp")));
@property BOOL promptProtocol __attribute__((swift_name("promptProtocol")));
@property (readonly) NSString *refreshToken __attribute__((swift_name("refreshToken")));
@property (readonly) int32_t refreshTokenExp __attribute__((swift_name("refreshTokenExp")));
@property (readonly) NovaCoreGamePlayer *reveal __attribute__((swift_name("reveal")));
@property (readonly) NSString *serialized __attribute__((swift_name("serialized")));
@property (readonly) NSString *showPlayerName __attribute__((swift_name("showPlayerName")));
@property NovaCoreTipsInfo *tipsInfo __attribute__((swift_name("tipsInfo")));
@property NSString *uuid __attribute__((swift_name("uuid")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Player.Companion")))
@interface NovaCorePlayerCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePlayerCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerToken")))
@interface NovaCorePlayerToken : NovaCoreBase
- (instancetype)initWithToken:(NSString *)token exp:(int32_t)exp __attribute__((swift_name("init(token:exp:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCorePlayerTokenCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)description __attribute__((swift_name("description()")));
@property int32_t exp __attribute__((swift_name("exp")));
@property (readonly) BOOL isExpired __attribute__((swift_name("isExpired")));
@property NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerToken.Companion")))
@interface NovaCorePlayerTokenCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePlayerTokenCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RefreshToken")))
@interface NovaCoreRefreshToken : NovaCoreBase
- (instancetype)initWithToken:(NSString *)token exp:(int32_t)exp __attribute__((swift_name("init(token:exp:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreRefreshTokenCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)description __attribute__((swift_name("description()")));
@property int32_t exp __attribute__((swift_name("exp")));
@property (readonly) BOOL isExpired __attribute__((swift_name("isExpired")));
@property NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RefreshToken.Companion")))
@interface NovaCoreRefreshTokenCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreRefreshTokenCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
 *   kotlinx.serialization.SerialName(value="RefreshTokenVerifiedCredentials")
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RefreshTokenVerifiedCredentials")))
@interface NovaCoreRefreshTokenVerifiedCredentials : NovaCorePlatformCredentials
- (instancetype)initWithToken:(NSString *)token preservedLoginPlatform:(NSString *)preservedLoginPlatform __attribute__((swift_name("init(token:preservedLoginPlatform:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreRefreshTokenVerifiedCredentialsCompanion *companion __attribute__((swift_name("companion")));
@property NSString *preservedLoginPlatform __attribute__((swift_name("preservedLoginPlatform")));
@property NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RefreshTokenVerifiedCredentials.Companion")))
@interface NovaCoreRefreshTokenVerifiedCredentialsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreRefreshTokenVerifiedCredentialsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RegionalAgent")))
@interface NovaCoreRegionalAgent : NovaCoreKotlinEnum<NovaCoreRegionalAgent *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreRegionalAgentCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreRegionalAgent *hhgames __attribute__((swift_name("hhgames")));
@property (class, readonly) NovaCoreRegionalAgent *unknown __attribute__((swift_name("unknown")));
+ (NovaCoreKotlinArray<NovaCoreRegionalAgent *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreRegionalAgent *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RegionalAgent.Companion")))
@interface NovaCoreRegionalAgentCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreRegionalAgentCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreRegionalAgent *)getEnumByValueValue:(NSString *)value __attribute__((swift_name("getEnumByValue(value:)")));
@property (readonly) NovaCoreRegionalAgent *current __attribute__((swift_name("current")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RemoteGameConfig")))
@interface NovaCoreRemoteGameConfig : NovaCoreGameConfigBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithString:(NSString *)string __attribute__((swift_name("init(string:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreRemoteGameConfigCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)description __attribute__((swift_name("description()")));
@property BOOL accountSwitchingAllowed __attribute__((swift_name("accountSwitchingAllowed")));
@property NovaCoreWeightedRandom * _Nullable adMediationRandom __attribute__((swift_name("adMediationRandom")));
@property BOOL ageSignalsAllowed __attribute__((swift_name("ageSignalsAllowed")));
@property int32_t ageSignalsCacheSeconds __attribute__((swift_name("ageSignalsCacheSeconds")));
@property BOOL appleAllowed __attribute__((swift_name("appleAllowed")));
@property BOOL chargeAllowed __attribute__((swift_name("chargeAllowed")));
@property NSString *code __attribute__((swift_name("code")));
@property NSString *country __attribute__((swift_name("country")));
@property NSString *country3 __attribute__((swift_name("country3")));
@property BOOL emailAllowed __attribute__((swift_name("emailAllowed")));
@property BOOL facebookAllowed __attribute__((swift_name("facebookAllowed")));
@property BOOL forumAllowed __attribute__((swift_name("forumAllowed")));
@property BOOL googleAllowed __attribute__((swift_name("googleAllowed")));
@property BOOL hhgameRealNameAuthentication __attribute__((swift_name("hhgameRealNameAuthentication")));
@property BOOL idfaAllowed __attribute__((swift_name("idfaAllowed")));
@property NovaCoreIntegrityConfig *integrityConfig __attribute__((swift_name("integrityConfig")));
@property BOOL isConfirmAgreementAtFirst __attribute__((swift_name("isConfirmAgreementAtFirst")));
@property BOOL isInEU __attribute__((swift_name("isInEU")));
@property BOOL isShareToFacebook __attribute__((swift_name("isShareToFacebook")));
@property BOOL isShareToInstagram __attribute__((swift_name("isShareToInstagram")));
@property BOOL isShareToKakao __attribute__((swift_name("isShareToKakao")));
@property BOOL isShareToLine __attribute__((swift_name("isShareToLine")));
@property BOOL isShareToMessenger __attribute__((swift_name("isShareToMessenger")));
@property BOOL isShareToTwitter __attribute__((swift_name("isShareToTwitter")));
@property BOOL isShareToVK __attribute__((swift_name("isShareToVK")));
@property BOOL isShareToWhatsApp __attribute__((swift_name("isShareToWhatsApp")));
@property BOOL isSurveyAllowed __attribute__((swift_name("isSurveyAllowed")));
@property BOOL kakaoAllowed __attribute__((swift_name("kakaoAllowed")));
@property BOOL lineAllowed __attribute__((swift_name("lineAllowed")));
@property BOOL loginHistoryAllowed __attribute__((swift_name("loginHistoryAllowed")));
@property NSString *loginPageLogo __attribute__((swift_name("loginPageLogo")));
@property int32_t maxRetentionDays __attribute__((swift_name("maxRetentionDays")));
@property NSString *name __attribute__((swift_name("name")));
@property BOOL personalCenterLinkAccountAllowed __attribute__((swift_name("personalCenterLinkAccountAllowed")));
@property NSString *recommendLoginMode __attribute__((swift_name("recommendLoginMode")));
@property NovaCoreRevealedPlatform * _Nullable recommendLoginPlatform __attribute__((swift_name("recommendLoginPlatform")));
@property BOOL securityCenterAllowed __attribute__((swift_name("securityCenterAllowed")));
@property BOOL securityCodeAllowed __attribute__((swift_name("securityCodeAllowed")));
@property BOOL shareButtonAllowed __attribute__((swift_name("shareButtonAllowed")));
@property NSString *shareUrlForFacebook __attribute__((swift_name("shareUrlForFacebook")));
@property NSString *shareUrlForInstagram __attribute__((swift_name("shareUrlForInstagram")));
@property NSString *shareUrlForKakao __attribute__((swift_name("shareUrlForKakao")));
@property NSString *shareUrlForLine __attribute__((swift_name("shareUrlForLine")));
@property NSString *shareUrlForMessenger __attribute__((swift_name("shareUrlForMessenger")));
@property NSString *shareUrlForTwitter __attribute__((swift_name("shareUrlForTwitter")));
@property NSString *shareUrlForVK __attribute__((swift_name("shareUrlForVK")));
@property NSString *shareUrlForWhatsApp __attribute__((swift_name("shareUrlForWhatsApp")));
@property (readonly) BOOL shouldConfirmAgreement __attribute__((swift_name("shouldConfirmAgreement")));
@property BOOL silenceLoginAllowed __attribute__((swift_name("silenceLoginAllowed")));
@property NovaCoreSocialMedia *socialMedia __attribute__((swift_name("socialMedia")));
@property BOOL supportAllowed __attribute__((swift_name("supportAllowed")));
@property BOOL tpAllowed __attribute__((swift_name("tpAllowed")));
@property NSString *tpContent __attribute__((swift_name("tpContent")));
@property NovaCoreBrowserType *tpContentShowType __attribute__((swift_name("tpContentShowType")));
@property NSString *tpGuide __attribute__((swift_name("tpGuide")));
@property NovaCoreBrowserType *tpGuideShowType __attribute__((swift_name("tpGuideShowType")));
@property BOOL vkAllowed __attribute__((swift_name("vkAllowed")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RemoteGameConfig.Companion")))
@interface NovaCoreRemoteGameConfigCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreRemoteGameConfigCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RevealedPlatform")))
@interface NovaCoreRevealedPlatform : NovaCoreKotlinEnum<NovaCoreRevealedPlatform *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreRevealedPlatformCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreRevealedPlatform *device __attribute__((swift_name("device")));
@property (class, readonly) NovaCoreRevealedPlatform *email __attribute__((swift_name("email")));
@property (class, readonly) NovaCoreRevealedPlatform *phone __attribute__((swift_name("phone")));
@property (class, readonly) NovaCoreRevealedPlatform *facebook __attribute__((swift_name("facebook")));
@property (class, readonly) NovaCoreRevealedPlatform *apple __attribute__((swift_name("apple")));
@property (class, readonly) NovaCoreRevealedPlatform *google __attribute__((swift_name("google")));
@property (class, readonly) NovaCoreRevealedPlatform *line __attribute__((swift_name("line")));
@property (class, readonly) NovaCoreRevealedPlatform *vk __attribute__((swift_name("vk")));
@property (class, readonly) NovaCoreRevealedPlatform *kakao __attribute__((swift_name("kakao")));
@property (class, readonly) NovaCoreRevealedPlatform *unknown __attribute__((swift_name("unknown")));
+ (NovaCoreKotlinArray<NovaCoreRevealedPlatform *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreRevealedPlatform *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *platform __attribute__((swift_name("platform")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RevealedPlatform.Companion")))
@interface NovaCoreRevealedPlatformCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreRevealedPlatformCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreRevealedPlatform *)getEnumByValueNeedle:(NSString *)needle default:(NovaCoreRevealedPlatform *)default_ __attribute__((swift_name("getEnumByValue(needle:default:)")));
- (BOOL)hasValueNeedle:(NSString *)needle __attribute__((swift_name("hasValue(needle:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ServerType")))
@interface NovaCoreServerType : NovaCoreKotlinEnum<NovaCoreServerType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreServerTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreServerType *all __attribute__((swift_name("all")));
@property (class, readonly) NovaCoreServerType *ios __attribute__((swift_name("ios")));
@property (class, readonly) NovaCoreServerType *android __attribute__((swift_name("android")));
@property (class, readonly) NovaCoreServerType *unset __attribute__((swift_name("unset")));
+ (NovaCoreKotlinArray<NovaCoreServerType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreServerType *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *platform __attribute__((swift_name("platform")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ServerType.Companion")))
@interface NovaCoreServerTypeCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreServerTypeCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreServerType *)getEnumByValuePlatform:(NSString *)platform __attribute__((swift_name("getEnumByValue(platform:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ShareContent")))
@interface NovaCoreShareContent : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithPlatform:(NovaCoreSocialPlatform *)platform __attribute__((swift_name("init(platform:)"))) __attribute__((objc_designated_initializer)) __attribute__((deprecated("Platform is deprecated")));
- (instancetype)initWithText:(NSString *)text __attribute__((swift_name("init(text:)"))) __attribute__((objc_designated_initializer));
@property id _Nullable image __attribute__((swift_name("image")));
@property NSString * _Nullable imagePath __attribute__((swift_name("imagePath")));
@property NovaCoreSocialPlatform * _Nullable platform __attribute__((swift_name("platform"))) __attribute__((deprecated("Platform is deprecated")));
@property NSString * _Nullable text __attribute__((swift_name("text")));
@property NSString * _Nullable url __attribute__((swift_name("url")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ShareElement")))
@interface NovaCoreShareElement : NovaCoreBase
- (instancetype)initWithPlatform:(NovaCoreSocialPlatform *)platform text:(NSString * _Nullable)text __attribute__((swift_name("init(platform:text:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreShareElement *)doCopyPlatform:(NovaCoreSocialPlatform *)platform text:(NSString * _Nullable)text __attribute__((swift_name("doCopy(platform:text:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NovaCoreSocialPlatform *platform __attribute__((swift_name("platform")));
@property (readonly) NSString * _Nullable text __attribute__((swift_name("text")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ShareResult")))
@interface NovaCoreShareResult : NovaCoreBase
- (instancetype)initWithPlatform:(NovaCoreSocialPlatform *)platform status:(NovaCoreShareStatus *)status message:(NSString *)message __attribute__((swift_name("init(platform:status:message:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreShareResultCompanion *companion __attribute__((swift_name("companion")));
@property NSString *message __attribute__((swift_name("message")));
@property NovaCoreSocialPlatform *platform __attribute__((swift_name("platform")));
@property NovaCoreShareStatus *status __attribute__((swift_name("status")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ShareResult.Companion")))
@interface NovaCoreShareResultCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreShareResultCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreShareResult *)failurePlatform:(NovaCoreSocialPlatform *)platform message:(NSString *)message __attribute__((swift_name("failure(platform:message:)")));
- (NovaCoreShareResult *)successPlatform:(NovaCoreSocialPlatform *)platform __attribute__((swift_name("success(platform:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ShareStatus")))
@interface NovaCoreShareStatus : NovaCoreKotlinEnum<NovaCoreShareStatus *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreShareStatus *success __attribute__((swift_name("success")));
@property (class, readonly) NovaCoreShareStatus *failure __attribute__((swift_name("failure")));
+ (NovaCoreKotlinArray<NovaCoreShareStatus *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreShareStatus *> *entries __attribute__((swift_name("entries")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SharingData")))
@interface NovaCoreSharingData : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (class, readonly, getter=companion) NovaCoreSharingDataCompanion *companion __attribute__((swift_name("companion")));
@property NSString *deviceId __attribute__((swift_name("deviceId")));
@property (readonly) NSString *sdkVersion __attribute__((swift_name("sdkVersion")));
@property NSString *tdDistinctId __attribute__((swift_name("tdDistinctId")));
@property double zoneOffset __attribute__((swift_name("zoneOffset")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SharingData.Companion")))
@interface NovaCoreSharingDataCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreSharingDataCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SocialMedia")))
@interface NovaCoreSocialMedia : NovaCoreBase
- (instancetype)initWithCustomerEmail:(NSString *)customerEmail __attribute__((swift_name("init(customerEmail:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithJson:(NovaCoreKotlinx_serialization_jsonJsonElement *)json __attribute__((swift_name("init(json:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreSocialMediaCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreSocialMedia *)doCopyCustomerEmail:(NSString *)customerEmail __attribute__((swift_name("doCopy(customerEmail:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NovaCoreBrowserType *alternativeBillingShowType __attribute__((swift_name("alternativeBillingShowType")));
@property NSString *customerEmail __attribute__((swift_name("customerEmail")));
@property NSString *officialWebsite __attribute__((swift_name("officialWebsite")));
@property BOOL officialWebsiteBonus __attribute__((swift_name("officialWebsiteBonus")));
@property NovaCoreBrowserType *officialWebsiteShowType __attribute__((swift_name("officialWebsiteShowType")));
@property NovaCoreBrowserType *orderDetailsShowType __attribute__((swift_name("orderDetailsShowType")));
@property NSString *orderDetailsUrl __attribute__((swift_name("orderDetailsUrl")));
@property NSString *rechargeOfficialWebsite __attribute__((swift_name("rechargeOfficialWebsite")));
@property NovaCoreBrowserType *rechargeOfficialWebsiteShowType __attribute__((swift_name("rechargeOfficialWebsiteShowType")));
@property (readonly) NSMutableArray<NovaCoreSocialMediaItem *> *socialMediaList __attribute__((swift_name("socialMediaList")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SocialMedia.Companion")))
@interface NovaCoreSocialMediaCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreSocialMediaCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SocialMediaItem")))
@interface NovaCoreSocialMediaItem : NovaCoreBase
- (instancetype)initWithPlatform:(NSString *)platform link:(NSString *)link sort:(int32_t)sort __attribute__((swift_name("init(platform:link:sort:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreSocialMediaItemCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreSocialMediaItem *)doCopyPlatform:(NSString *)platform link:(NSString *)link sort:(int32_t)sort __attribute__((swift_name("doCopy(platform:link:sort:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *link __attribute__((swift_name("link")));
@property (readonly) NSString *platform __attribute__((swift_name("platform")));
@property (readonly) int32_t sort __attribute__((swift_name("sort")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SocialMediaItem.Companion")))
@interface NovaCoreSocialMediaItemCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreSocialMediaItemCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SocialPlatform")))
@interface NovaCoreSocialPlatform : NovaCoreKotlinEnum<NovaCoreSocialPlatform *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreSocialPlatformCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreSocialPlatform *facebook __attribute__((swift_name("facebook")));
@property (class, readonly) NovaCoreSocialPlatform *line __attribute__((swift_name("line")));
@property (class, readonly) NovaCoreSocialPlatform *vk __attribute__((swift_name("vk")));
@property (class, readonly) NovaCoreSocialPlatform *whatsapp __attribute__((swift_name("whatsapp")));
@property (class, readonly) NovaCoreSocialPlatform *kakao __attribute__((swift_name("kakao")));
@property (class, readonly) NovaCoreSocialPlatform *messenger __attribute__((swift_name("messenger")));
@property (class, readonly) NovaCoreSocialPlatform *unknown __attribute__((swift_name("unknown")));
+ (NovaCoreKotlinArray<NovaCoreSocialPlatform *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreSocialPlatform *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *platform __attribute__((swift_name("platform")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SocialPlatform.Companion")))
@interface NovaCoreSocialPlatformCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreSocialPlatformCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreSocialPlatform *)getEnumByValueNeedle:(NSString *)needle default:(NovaCoreSocialPlatform *)default_ __attribute__((swift_name("getEnumByValue(needle:default:)")));
- (BOOL)hasValueNeedle:(NSString *)needle __attribute__((swift_name("hasValue(needle:)")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(NovaCoreKotlinArray<id<NovaCoreKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Theme")))
@interface NovaCoreTheme : NovaCoreKotlinEnum<NovaCoreTheme *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreThemeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreTheme *light __attribute__((swift_name("light")));
@property (class, readonly) NovaCoreTheme *dark __attribute__((swift_name("dark")));
+ (NovaCoreKotlinArray<NovaCoreTheme *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreTheme *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Theme.Companion")))
@interface NovaCoreThemeCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreThemeCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreTheme *)getEnumByValueValue:(NSString *)value __attribute__((swift_name("getEnumByValue(value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThemeBorderTextField")))
@interface NovaCoreThemeBorderTextField : NovaCoreBase
- (instancetype)initWithFontSize:(float)fontSize textColor:(NovaCoreThemeColor *)textColor placeholder:(NovaCoreThemeColor *)placeholder borderColor:(NovaCoreThemeColor *)borderColor focusBorderColor:(NovaCoreThemeColor *)focusBorderColor __attribute__((swift_name("init(fontSize:textColor:placeholder:borderColor:focusBorderColor:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreThemeBorderTextField *)doCopyFontSize:(float)fontSize textColor:(NovaCoreThemeColor *)textColor placeholder:(NovaCoreThemeColor *)placeholder borderColor:(NovaCoreThemeColor *)borderColor focusBorderColor:(NovaCoreThemeColor *)focusBorderColor __attribute__((swift_name("doCopy(fontSize:textColor:placeholder:borderColor:focusBorderColor:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NovaCoreThemeColor *borderColor __attribute__((swift_name("borderColor")));
@property NovaCoreThemeColor *focusBorderColor __attribute__((swift_name("focusBorderColor")));
@property float fontSize __attribute__((swift_name("fontSize")));
@property NovaCoreThemeColor *placeholder __attribute__((swift_name("placeholder")));
@property NovaCoreThemeColor *textColor __attribute__((swift_name("textColor")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThemeButton")))
@interface NovaCoreThemeButton : NovaCoreBase
- (instancetype)initWithFontSize:(float)fontSize bold:(BOOL)bold textColor:(NovaCoreThemeColor *)textColor backgroundColor:(NovaCoreThemeColor *)backgroundColor highlightBackgroundColor:(NovaCoreThemeColor *)highlightBackgroundColor __attribute__((swift_name("init(fontSize:bold:textColor:backgroundColor:highlightBackgroundColor:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreThemeButton *)doCopyFontSize:(float)fontSize bold:(BOOL)bold textColor:(NovaCoreThemeColor *)textColor backgroundColor:(NovaCoreThemeColor *)backgroundColor highlightBackgroundColor:(NovaCoreThemeColor *)highlightBackgroundColor __attribute__((swift_name("doCopy(fontSize:bold:textColor:backgroundColor:highlightBackgroundColor:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NovaCoreThemeColor *backgroundColor __attribute__((swift_name("backgroundColor")));
@property BOOL bold __attribute__((swift_name("bold")));
@property float fontSize __attribute__((swift_name("fontSize")));
@property NovaCoreThemeColor *highlightBackgroundColor __attribute__((swift_name("highlightBackgroundColor")));
@property NovaCoreThemeColor *textColor __attribute__((swift_name("textColor")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThemeCell")))
@interface NovaCoreThemeCell : NovaCoreBase
- (instancetype)initWithBackgroundColor:(NovaCoreThemeColor *)backgroundColor highlightBackgroundColor:(NovaCoreThemeColor *)highlightBackgroundColor selectedBackgroundColor:(NovaCoreThemeColor *)selectedBackgroundColor titleFontSize:(float)titleFontSize titleTextColor:(NovaCoreThemeColor *)titleTextColor selectedTitleTextColor:(NovaCoreThemeColor *)selectedTitleTextColor titleTextBold:(BOOL)titleTextBold titleTextSelectedBold:(BOOL)titleTextSelectedBold __attribute__((swift_name("init(backgroundColor:highlightBackgroundColor:selectedBackgroundColor:titleFontSize:titleTextColor:selectedTitleTextColor:titleTextBold:titleTextSelectedBold:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreThemeCell *)doCopyBackgroundColor:(NovaCoreThemeColor *)backgroundColor highlightBackgroundColor:(NovaCoreThemeColor *)highlightBackgroundColor selectedBackgroundColor:(NovaCoreThemeColor *)selectedBackgroundColor titleFontSize:(float)titleFontSize titleTextColor:(NovaCoreThemeColor *)titleTextColor selectedTitleTextColor:(NovaCoreThemeColor *)selectedTitleTextColor titleTextBold:(BOOL)titleTextBold titleTextSelectedBold:(BOOL)titleTextSelectedBold __attribute__((swift_name("doCopy(backgroundColor:highlightBackgroundColor:selectedBackgroundColor:titleFontSize:titleTextColor:selectedTitleTextColor:titleTextBold:titleTextSelectedBold:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NovaCoreThemeColor *backgroundColor __attribute__((swift_name("backgroundColor")));
@property NovaCoreThemeColor *highlightBackgroundColor __attribute__((swift_name("highlightBackgroundColor")));
@property NovaCoreThemeColor *selectedBackgroundColor __attribute__((swift_name("selectedBackgroundColor")));
@property NovaCoreThemeColor *selectedTitleTextColor __attribute__((swift_name("selectedTitleTextColor")));
@property float titleFontSize __attribute__((swift_name("titleFontSize")));
@property BOOL titleTextBold __attribute__((swift_name("titleTextBold")));
@property NovaCoreThemeColor *titleTextColor __attribute__((swift_name("titleTextColor")));
@property BOOL titleTextSelectedBold __attribute__((swift_name("titleTextSelectedBold")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThemeColor")))
@interface NovaCoreThemeColor : NovaCoreBase
- (instancetype)initWithLight:(NSString *)light dark:(NSString *)dark __attribute__((swift_name("init(light:dark:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreThemeColor *)doCopyLight:(NSString *)light dark:(NSString *)dark __attribute__((swift_name("doCopy(light:dark:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NovaCoreTheme *appearance __attribute__((swift_name("appearance")));
@property NSString *dark __attribute__((swift_name("dark")));
@property NSString *light __attribute__((swift_name("light")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThemeLine")))
@interface NovaCoreThemeLine : NovaCoreBase
- (instancetype)initWithBackgroundColor:(NovaCoreThemeColor *)backgroundColor width:(float)width __attribute__((swift_name("init(backgroundColor:width:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreThemeLine *)doCopyBackgroundColor:(NovaCoreThemeColor *)backgroundColor width:(float)width __attribute__((swift_name("doCopy(backgroundColor:width:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NovaCoreThemeColor *backgroundColor __attribute__((swift_name("backgroundColor")));
@property float width __attribute__((swift_name("width")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThemeTitle")))
@interface NovaCoreThemeTitle : NovaCoreBase
- (instancetype)initWithFontSize:(float)fontSize textColor:(NovaCoreThemeColor *)textColor bold:(BOOL)bold __attribute__((swift_name("init(fontSize:textColor:bold:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreThemeTitle *)doCopyFontSize:(float)fontSize textColor:(NovaCoreThemeColor *)textColor bold:(BOOL)bold __attribute__((swift_name("doCopy(fontSize:textColor:bold:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property BOOL bold __attribute__((swift_name("bold")));
@property float fontSize __attribute__((swift_name("fontSize")));
@property NovaCoreThemeColor *textColor __attribute__((swift_name("textColor")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThirdPartyTokens")))
@interface NovaCoreThirdPartyTokens : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithData:(NSString *)data __attribute__((swift_name("init(data:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (NSString *)findAdUnitIdAdUnitName:(NSString *)adUnitName adType:(NovaCoreAdType *)adType adMediation:(NovaCoreAdMediation *)adMediation __attribute__((swift_name("findAdUnitId(adUnitName:adType:adMediation:)")));
- (NovaCoreKotlinArray<NSString *> *)findAllAdUnitIdAdType:(NovaCoreAdType *)adType adMediation:(NovaCoreAdMediation *)adMediation __attribute__((swift_name("findAllAdUnitId(adType:adMediation:)")));
- (void)reloadElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("reload(element:)")));
@property NovaCoreMutableDictionary<NSString *, NSString *> *adjust __attribute__((swift_name("adjust")));
@property NovaCoreMutableDictionary<NSString *, NSString *> *facebook __attribute__((swift_name("facebook")));
@property NovaCoreMutableDictionary<NSString *, NSString *> *firebase __attribute__((swift_name("firebase")));
@property NovaCoreMutableDictionary<NSString *, NSString *> *tiktok __attribute__((swift_name("tiktok")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TipsInfo")))
@interface NovaCoreTipsInfo : NovaCoreBase
- (instancetype)initWithStatus:(NovaCoreTipsStatus *)status __attribute__((swift_name("init(status:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreTipsInfoCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreTipsInfo *)doCopyStatus:(NovaCoreTipsStatus *)status __attribute__((swift_name("doCopy(status:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property int32_t count __attribute__((swift_name("count")));
@property NSString *link __attribute__((swift_name("link")));
@property NSString *showSum __attribute__((swift_name("showSum")));
@property NovaCoreTipsStatus *status __attribute__((swift_name("status")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TipsInfo.Companion")))
@interface NovaCoreTipsInfoCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreTipsInfoCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TipsStatus")))
@interface NovaCoreTipsStatus : NovaCoreKotlinEnum<NovaCoreTipsStatus *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreTipsStatusCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreTipsStatus *normal __attribute__((swift_name("normal")));
@property (class, readonly) NovaCoreTipsStatus *warning __attribute__((swift_name("warning")));
@property (class, readonly) NovaCoreTipsStatus *frozen __attribute__((swift_name("frozen")));
+ (NovaCoreKotlinArray<NovaCoreTipsStatus *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreTipsStatus *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *status __attribute__((swift_name("status")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TipsStatus.Companion")))
@interface NovaCoreTipsStatusCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreTipsStatusCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreTipsStatus *)getEnumByValueStatus:(NSString *)status __attribute__((swift_name("getEnumByValue(status:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TokenData")))
@interface NovaCoreTokenData : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPlayerId:(NSString *)playerId platform:(NovaCoreRevealedPlatform *)platform playerToken:(NovaCorePlayerToken *)playerToken refreshToken:(NovaCoreRefreshToken *)refreshToken __attribute__((swift_name("init(playerId:platform:playerToken:refreshToken:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreTokenDataCompanion *companion __attribute__((swift_name("companion")));
- (void)clear __attribute__((swift_name("clear()")));
- (BOOL)isEmpty __attribute__((swift_name("isEmpty()")));
- (BOOL)isNotEmpty __attribute__((swift_name("isNotEmpty()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NovaCoreRevealedPlatform *platform __attribute__((swift_name("platform")));
@property NSString *playerId __attribute__((swift_name("playerId")));
@property NovaCorePlayerToken *playerToken __attribute__((swift_name("playerToken")));
@property NovaCoreRefreshToken *refreshToken __attribute__((swift_name("refreshToken")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TokenData.Companion")))
@interface NovaCoreTokenDataCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreTokenDataCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@property (readonly) NovaCoreTokenData *last __attribute__((swift_name("last")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("VerifiablePlatform")))
@interface NovaCoreVerifiablePlatform : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithEle:(NovaCoreKotlinx_serialization_jsonJsonElement *)ele __attribute__((swift_name("init(ele:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreVerifiablePlatformCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NSString *nickname __attribute__((swift_name("nickname")));
@property NovaCoreRevealedPlatform *platform __attribute__((swift_name("platform")));
@property NSString *uuid __attribute__((swift_name("uuid")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("VerifiablePlatform.Companion")))
@interface NovaCoreVerifiablePlatformCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreVerifiablePlatformCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("VerificationCodeType")))
@interface NovaCoreVerificationCodeType : NovaCoreKotlinEnum<NovaCoreVerificationCodeType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreVerificationCodeType *emailConnect __attribute__((swift_name("emailConnect")));
@property (class, readonly) NovaCoreVerificationCodeType *emailLogin __attribute__((swift_name("emailLogin")));
+ (NovaCoreKotlinArray<NovaCoreVerificationCodeType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreVerificationCodeType *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *typeName __attribute__((swift_name("typeName")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("WeightedRandom")))
@interface NovaCoreWeightedRandom : NovaCoreBase
- (instancetype)initWithWeights:(NSDictionary<NSString *, NovaCoreInt *> *)weights __attribute__((swift_name("init(weights:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreWeightedRandomCompanion *companion __attribute__((swift_name("companion")));
- (int32_t)getWeightMediation:(NovaCoreAdMediation *)mediation __attribute__((swift_name("getWeight(mediation:)")));
- (NovaCoreAdMediation *)next __attribute__((swift_name("next()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("WeightedRandom.Companion")))
@interface NovaCoreWeightedRandomCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreWeightedRandomCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("officialWebsite")))
@interface NovaCoreofficialWebsite : NovaCoreBase
- (instancetype)initWithAllowed:(BOOL)allowed link:(NSString *)link bonus:(BOOL)bonus __attribute__((swift_name("init(allowed:link:bonus:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreofficialWebsiteCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreofficialWebsite *)doCopyAllowed:(BOOL)allowed link:(NSString *)link bonus:(BOOL)bonus __attribute__((swift_name("doCopy(allowed:link:bonus:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property BOOL allowed __attribute__((swift_name("allowed")));
@property BOOL bonus __attribute__((swift_name("bonus")));
@property NSString *link __attribute__((swift_name("link")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("officialWebsite.Companion")))
@interface NovaCoreofficialWebsiteCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreofficialWebsiteCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((swift_name("BackgroundEvent")))
@interface NovaCoreBackgroundEvent : NovaCoreBase
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ConfiguredEvent")))
@interface NovaCoreConfiguredEvent : NovaCoreBackgroundEvent
- (instancetype)initWithRemoteGameConfig:(NovaCoreRemoteGameConfig *)remoteGameConfig __attribute__((swift_name("init(remoteGameConfig:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NovaCoreRemoteGameConfig *remoteGameConfig __attribute__((swift_name("remoteGameConfig")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("EventHub")))
@interface NovaCoreEventHub<EventType> : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)notifyEvent:(EventType)event __attribute__((swift_name("notify(event:)")));
- (void)thenRun:(void (^)(EventType))run __attribute__((swift_name("then(run:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FetchConfigFinishedEvent")))
@interface NovaCoreFetchConfigFinishedEvent : NovaCoreBackgroundEvent
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerConnectedEvent")))
@interface NovaCorePlayerConnectedEvent : NovaCoreBackgroundEvent
- (instancetype)initWithPlayer:(NovaCoreGamePlayer *)player __attribute__((swift_name("init(player:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NovaCoreGamePlayer *player __attribute__((swift_name("player")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerSwitchedEvent")))
@interface NovaCorePlayerSwitchedEvent : NovaCoreBackgroundEvent
- (instancetype)initWithOldPlayer:(NovaCoreGamePlayer *)oldPlayer newPlayer:(NovaCoreGamePlayer *)newPlayer __attribute__((swift_name("init(oldPlayer:newPlayer:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly, getter=doNewPlayer) NovaCoreGamePlayer *newPlayer __attribute__((swift_name("newPlayer")));
@property (readonly) NovaCoreGamePlayer *oldPlayer __attribute__((swift_name("oldPlayer")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ShareFinishedEvent")))
@interface NovaCoreShareFinishedEvent : NovaCoreBackgroundEvent
- (instancetype)initWithPlatform:(NovaCoreSocialPlatform *)platform isSuccess:(BOOL)isSuccess __attribute__((swift_name("init(platform:isSuccess:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) BOOL isSuccess __attribute__((swift_name("isSuccess")));
@property (readonly) NovaCoreSocialPlatform *platform __attribute__((swift_name("platform")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TokenRefreshEvent")))
@interface NovaCoreTokenRefreshEvent : NovaCoreBackgroundEvent
- (instancetype)initWithToken:(NSString *)token __attribute__((swift_name("init(token:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Language")))
@interface NovaCoreLanguage : NovaCoreKotlinEnum<NovaCoreLanguage *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreLanguageCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreLanguage *english __attribute__((swift_name("english")));
@property (class, readonly) NovaCoreLanguage *french __attribute__((swift_name("french")));
@property (class, readonly) NovaCoreLanguage *german __attribute__((swift_name("german")));
@property (class, readonly) NovaCoreLanguage *italian __attribute__((swift_name("italian")));
@property (class, readonly) NovaCoreLanguage *japanese __attribute__((swift_name("japanese")));
@property (class, readonly) NovaCoreLanguage *korean __attribute__((swift_name("korean")));
@property (class, readonly) NovaCoreLanguage *portuguese __attribute__((swift_name("portuguese")));
@property (class, readonly) NovaCoreLanguage *russian __attribute__((swift_name("russian")));
@property (class, readonly) NovaCoreLanguage *spanish __attribute__((swift_name("spanish")));
@property (class, readonly) NovaCoreLanguage *chineseSimplified __attribute__((swift_name("chineseSimplified")));
@property (class, readonly) NovaCoreLanguage *thai __attribute__((swift_name("thai")));
@property (class, readonly) NovaCoreLanguage *vietnamese __attribute__((swift_name("vietnamese")));
@property (class, readonly) NovaCoreLanguage *indonesian __attribute__((swift_name("indonesian")));
@property (class, readonly) NovaCoreLanguage *chineseTraditional __attribute__((swift_name("chineseTraditional")));
+ (NovaCoreKotlinArray<NovaCoreLanguage *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreLanguage *> *entries __attribute__((swift_name("entries")));
@property NSString *lang __attribute__((swift_name("lang")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Language.Companion")))
@interface NovaCoreLanguageCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreLanguageCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreLanguage *)getEnumByNameName:(NSString *)name __attribute__((swift_name("getEnumByName(name:)")));
- (NovaCoreLanguage *)getEnumByValueLanguage:(NSString *)language __attribute__((swift_name("getEnumByValue(language:)")));
@end

__attribute__((swift_name("LoggerInterface")))
@protocol NovaCoreLoggerInterface
@required
- (void)debugMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("debug(message:args:)")));
- (void)errorMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("error(message:args:)")));
- (void)fatalMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("fatal(message:args:)")));
- (void)infoMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("info(message:args:)")));
- (void)noticeMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("notice(message:args:)")));
- (void)warningMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("warning(message:args:)")));
- (void)writeTraceInfo:(NovaCoreLogTraceInfo *)traceInfo __attribute__((swift_name("write(traceInfo:)")));
@property NovaCoreLogLevel *minLevel __attribute__((swift_name("minLevel")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ConsoleLogger")))
@interface NovaCoreConsoleLogger : NovaCoreBase <NovaCoreLoggerInterface>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)writeTraceInfo:(NovaCoreLogTraceInfo *)traceInfo __attribute__((swift_name("write(traceInfo:)")));
@property NovaCoreLogLevel *minLevel __attribute__((swift_name("minLevel")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LogLevel")))
@interface NovaCoreLogLevel : NovaCoreKotlinEnum<NovaCoreLogLevel *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreLogLevelCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreLogLevel *debug __attribute__((swift_name("debug")));
@property (class, readonly) NovaCoreLogLevel *notice __attribute__((swift_name("notice")));
@property (class, readonly) NovaCoreLogLevel *info __attribute__((swift_name("info")));
@property (class, readonly) NovaCoreLogLevel *warning __attribute__((swift_name("warning")));
@property (class, readonly) NovaCoreLogLevel *error __attribute__((swift_name("error")));
@property (class, readonly) NovaCoreLogLevel *fatal __attribute__((swift_name("fatal")));
+ (NovaCoreKotlinArray<NovaCoreLogLevel *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreLogLevel *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LogLevel.Companion")))
@interface NovaCoreLogLevelCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreLogLevelCompanion *shared __attribute__((swift_name("shared")));
- (int32_t)mapSeverityLogLevel:(NovaCoreLogLevel *)logLevel __attribute__((swift_name("mapSeverity(logLevel:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LogTraceInfo")))
@interface NovaCoreLogTraceInfo : NovaCoreBase
- (instancetype)initWithLevel:(NovaCoreLogLevel *)level message:(NSString *)message __attribute__((swift_name("init(level:message:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreLogTraceInfoCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreLogTraceInfo *)doCopyLevel:(NovaCoreLogLevel *)level message:(NSString *)message __attribute__((swift_name("doCopy(level:message:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="time_shift")
*/
@property int32_t createTime __attribute__((swift_name("createTime")));
@property (readonly) NovaCoreLogLevel *level __attribute__((swift_name("level")));
@property (readonly) NSString *message __attribute__((swift_name("message")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LogTraceInfo.Companion")))
@interface NovaCoreLogTraceInfoCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreLogTraceInfoCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LoggerInterfaceCompanion")))
@interface NovaCoreLoggerInterfaceCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreLoggerInterfaceCompanion *shared __attribute__((swift_name("shared")));
- (void)foreachBlock:(void (^)(id<NovaCoreLoggerInterface>))block __attribute__((swift_name("foreach(block:)")));
- (id<NovaCoreLoggerInterface> _Nullable)getName:(NSString *)name __attribute__((swift_name("get(name:)")));
- (void)installName:(NSString *)name logger:(id<NovaCoreLoggerInterface>)logger __attribute__((swift_name("install(name:logger:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PersistentStorageLogger")))
@interface NovaCorePersistentStorageLogger : NovaCoreBase <NovaCoreLoggerInterface>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (class, readonly, getter=companion) NovaCorePersistentStorageLoggerCompanion *companion __attribute__((swift_name("companion")));
- (void)writeTraceInfo:(NovaCoreLogTraceInfo *)traceInfo __attribute__((swift_name("write(traceInfo:)")));
@property NovaCoreLogLevel *minLevel __attribute__((swift_name("minLevel")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PersistentStorageLogger.Companion")))
@interface NovaCorePersistentStorageLoggerCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePersistentStorageLoggerCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *KEY_PREFIX __attribute__((swift_name("KEY_PREFIX")));
@property (readonly) NSString *LOG_INDEX_KEY __attribute__((swift_name("LOG_INDEX_KEY")));
@property (readonly) int32_t LOG_ROTATE_MAX_ITEM_SIZE __attribute__((swift_name("LOG_ROTATE_MAX_ITEM_SIZE")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TraceElement")))
@interface NovaCoreTraceElement : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NSString *caller __attribute__((swift_name("caller")));
@property NSString *fileName __attribute__((swift_name("fileName")));
@property NSString *lineNumber __attribute__((swift_name("lineNumber")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RunningPlatform")))
@interface NovaCoreRunningPlatform : NovaCoreKotlinEnum<NovaCoreRunningPlatform *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreRunningPlatform *native __attribute__((swift_name("native")));
@property (class, readonly) NovaCoreRunningPlatform *jvm __attribute__((swift_name("jvm")));
+ (NovaCoreKotlinArray<NovaCoreRunningPlatform *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreRunningPlatform *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("HttpClient")))
@interface NovaCoreHttpClient : NovaCoreBase
- (instancetype)initWithEngine:(id<NovaCoreRestfulHttpEngine>)engine __attribute__((swift_name("init(engine:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreRestfulHttpPromise *)sendAsyncRequest:(NovaCoreRestfulHttpRequest *)request __attribute__((swift_name("sendAsync(request:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("HttpMethod")))
@interface NovaCoreHttpMethod : NovaCoreKotlinEnum<NovaCoreHttpMethod *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreHttpMethod *get __attribute__((swift_name("get")));
@property (class, readonly) NovaCoreHttpMethod *post __attribute__((swift_name("post")));
@property (class, readonly) NovaCoreHttpMethod *patch __attribute__((swift_name("patch")));
@property (class, readonly) NovaCoreHttpMethod *put __attribute__((swift_name("put")));
@property (class, readonly) NovaCoreHttpMethod *head __attribute__((swift_name("head")));
@property (class, readonly) NovaCoreHttpMethod *delete_ __attribute__((swift_name("delete_")));
@property (class, readonly) NovaCoreHttpMethod *options __attribute__((swift_name("options")));
+ (NovaCoreKotlinArray<NovaCoreHttpMethod *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreHttpMethod *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("HttpScheme")))
@interface NovaCoreHttpScheme : NovaCoreKotlinEnum<NovaCoreHttpScheme *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreHttpScheme *http __attribute__((swift_name("http")));
@property (class, readonly) NovaCoreHttpScheme *https __attribute__((swift_name("https")));
+ (NovaCoreKotlinArray<NovaCoreHttpScheme *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreHttpScheme *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("HttpUtil")))
@interface NovaCoreHttpUtil : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)httpUtil __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreHttpUtil *shared __attribute__((swift_name("shared")));
- (NSString *)checkSchemeUrl:(NSString *)url __attribute__((swift_name("checkScheme(url:)")));
- (BOOL)isIpAddressHost:(NSString *)host __attribute__((swift_name("isIpAddress(host:)")));
@end

__attribute__((swift_name("RestfulHttpEngine")))
@protocol NovaCoreRestfulHttpEngine
@required
- (NovaCoreWaitable *)requestAsyncUri:(NSString *)uri onSuccess:(void (^)(NovaCoreRestfulHttpResponse *))onSuccess onError:(void (^)(NovaCoreKotlinThrowable *))onError method:(NovaCoreHttpMethod *)method headers:(NSDictionary<NSString *, NSString *> *)headers data:(NSDictionary<NSString *, id> *)data timeoutInMillisecond:(int64_t)timeoutInMillisecond __attribute__((swift_name("requestAsync(uri:onSuccess:onError:method:headers:data:timeoutInMillisecond:)")));
@end

__attribute__((swift_name("Waitable")))
@interface NovaCoreWaitable : NovaCoreBase
- (instancetype)initWithWaitFor:(NovaCoreWaitable * _Nullable)waitFor __attribute__((swift_name("init(waitFor:)"))) __attribute__((objc_designated_initializer));
- (void)await __attribute__((swift_name("await()")));
- (void)blockOther:(NovaCoreWaitable *)other __attribute__((swift_name("block(other:)")));
@end

__attribute__((swift_name("Rejectable")))
@protocol NovaCoreRejectable
@required
- (void)rejectReason:(NovaCoreKotlinThrowable *)reason __attribute__((swift_name("reject(reason:)")));
@end

__attribute__((swift_name("PromiseInterface")))
@interface NovaCorePromiseInterface<ResultType> : NovaCoreWaitable <NovaCoreRejectable>
- (instancetype)initWithWaitFor:(NovaCoreWaitable * _Nullable)waitFor __attribute__((swift_name("init(waitFor:)"))) __attribute__((objc_designated_initializer));
- (void)cancel __attribute__((swift_name("cancel()")));
- (NovaCorePromiseInterface<ResultType> *)catchesOnCaught:(void (^)(id _Nullable))onCaught __attribute__((swift_name("catches(onCaught:)")));
- (NovaCorePromiseInterface<ResultType> *)eventuallyRun:(void (^)(void))run __attribute__((swift_name("eventually(run:)")));
- (NovaCorePromiseInterface<ResultType> *)otherwiseRun:(void (^)(NovaCorePromiseInterface<ResultType> *, NovaCoreKotlinThrowable *))run __attribute__((swift_name("otherwise(run:)")));
- (void)rejectReason:(NovaCoreKotlinThrowable *)reason __attribute__((swift_name("reject(reason:)")));
- (void)resolveResult:(ResultType _Nullable)result __attribute__((swift_name("resolve(result:)")));
- (NovaCorePromiseInterface<ResultType> *)takeDelegationOther:(NovaCorePromiseInterface<ResultType> *)other __attribute__((swift_name("takeDelegation(other:)")));
- (NovaCorePromiseInterface<id> *)thenRun:(id _Nullable (^)(id<NovaCoreRejectable>, ResultType _Nullable))run __attribute__((swift_name("then(run:)")));
- (ResultType _Nullable)unwrap __attribute__((swift_name("unwrap()")));
@property NovaCoreKotlinThrowable * _Nullable error __attribute__((swift_name("error")));
@property ResultType _Nullable result __attribute__((swift_name("result")));
@property NovaCorePromiseState *state __attribute__((swift_name("state")));
@end

__attribute__((swift_name("Promise")))
@interface NovaCorePromise<ResultType> : NovaCorePromiseInterface<ResultType>
- (instancetype)initWithWaitFor:(NovaCoreWaitable * _Nullable)waitFor __attribute__((swift_name("init(waitFor:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCorePromiseCompanion *companion __attribute__((swift_name("companion")));
- (void)await __attribute__((swift_name("await()")));
- (void)cancel __attribute__((swift_name("cancel()")));
- (NovaCorePromiseInterface<ResultType> *)eventuallyRun:(void (^)(void))run __attribute__((swift_name("eventually(run:)")));
- (NovaCorePromiseInterface<ResultType> *)otherwiseRun:(void (^)(NovaCorePromiseInterface<ResultType> *, NovaCoreKotlinThrowable *))run __attribute__((swift_name("otherwise(run:)")));
- (void)rejectReason:(NovaCoreKotlinThrowable *)reason __attribute__((swift_name("reject(reason:)")));
- (void)resolveResult:(ResultType _Nullable)result __attribute__((swift_name("resolve(result:)")));
- (NovaCorePromiseInterface<id> *)thenRun:(id _Nullable (^)(id<NovaCoreRejectable>, ResultType _Nullable))run __attribute__((swift_name("then(run:)")));
- (ResultType _Nullable)unwrap __attribute__((swift_name("unwrap()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RestfulHttpPromise")))
@interface NovaCoreRestfulHttpPromise : NovaCorePromise<NovaCoreRestfulHttpResponse *>
- (instancetype)initWithEngine:(id<NovaCoreRestfulHttpEngine>)engine uri:(NSString *)uri method:(NovaCoreHttpMethod *)method headers:(NSDictionary<NSString *, NSString *> *)headers data:(NSDictionary<NSString *, id> *)data timeoutInMillisecond:(int64_t)timeoutInMillisecond __attribute__((swift_name("init(engine:uri:method:headers:data:timeoutInMillisecond:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithWaitFor:(NovaCoreWaitable * _Nullable)waitFor __attribute__((swift_name("init(waitFor:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (void)await __attribute__((swift_name("await()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RestfulHttpRequest")))
@interface NovaCoreRestfulHttpRequest : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)dataBuilderInit:(void (^)(NovaCoreRestfulHttpRequestPostDataBuilder *))init __attribute__((swift_name("dataBuilder(init:)")));
- (NSString *)getUri __attribute__((swift_name("getUri()")));
- (void)headerBuilderInit:(void (^)(NovaCoreRestfulHttpRequestHeaderBuilder *))init __attribute__((swift_name("headerBuilder(init:)")));
- (void)parameterBuilderInit:(void (^)(NovaCoreRestfulHttpRequestQueryParameterBuilder *))init __attribute__((swift_name("parameterBuilder(init:)")));
@property NSDictionary<NSString *, id> *data __attribute__((swift_name("data")));
@property BOOL followRedirects __attribute__((swift_name("followRedirects")));
@property NSDictionary<NSString *, NSString *> *headers __attribute__((swift_name("headers")));
@property NSString *host __attribute__((swift_name("host")));
@property NovaCoreHttpMethod *method __attribute__((swift_name("method")));
@property NSString *path __attribute__((swift_name("path")));
@property NovaCoreHttpScheme *scheme __attribute__((swift_name("scheme")));
@property int64_t timeoutInMillisecond __attribute__((swift_name("timeoutInMillisecond")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RestfulHttpRequestHeaderBuilder")))
@interface NovaCoreRestfulHttpRequestHeaderBuilder : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)addKey:(NSString *)key data:(NSString *)data __attribute__((swift_name("add(key:data:)")));
@property NovaCoreMutableDictionary<NSString *, NSString *> *headers __attribute__((swift_name("headers")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RestfulHttpRequestPostDataBuilder")))
@interface NovaCoreRestfulHttpRequestPostDataBuilder : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)addKey:(NSString *)key data:(NSString *)data __attribute__((swift_name("add(key:data:)")));
@property NovaCoreMutableDictionary<NSString *, NSString *> *postData __attribute__((swift_name("postData")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RestfulHttpRequestQueryParameterBuilder")))
@interface NovaCoreRestfulHttpRequestQueryParameterBuilder : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)addKey:(NSString *)key data:(NSString *)data __attribute__((swift_name("add(key:data:)")));
@property NovaCoreMutableDictionary<NSString *, NSString *> *parameters __attribute__((swift_name("parameters")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RestfulHttpResponse")))
@interface NovaCoreRestfulHttpResponse : NovaCoreBase
- (instancetype)initWithStatusCode:(int32_t)statusCode body:(NSString *)body __attribute__((swift_name("init(statusCode:body:)"))) __attribute__((objc_designated_initializer));
- (NovaCoreRestfulHttpResponse *)doCopyStatusCode:(int32_t)statusCode body:(NSString *)body __attribute__((swift_name("doCopy(statusCode:body:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *body __attribute__((swift_name("body")));
@property (readonly) int32_t statusCode __attribute__((swift_name("statusCode")));
@end

__attribute__((swift_name("PaymentHandlerInterface")))
@protocol NovaCorePaymentHandlerInterface
@required
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)acknowledgeOrderOrder:(NovaCorePayOrder *)order __attribute__((swift_name("acknowledgeOrder(order:)")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)consumeOrderOrder:(NovaCorePayOrder *)order __attribute__((swift_name("consumeOrder(order:)")));
- (NovaCorePromiseInterface<NovaCorePayOrder *> *)fillProductInfoOrder:(NovaCorePayOrder *)order __attribute__((swift_name("fillProductInfo(order:)")));
- (void)finishPurchase __attribute__((swift_name("finishPurchase()")));
- (NovaCorePromiseInterface<NSArray<NovaCoreProductInfo *> *> *)getAppProductInfoProductIdList:(NSArray<NSString *> *)productIdList __attribute__((swift_name("getAppProductInfo(productIdList:)")));
- (void)onProcessEventEvent:(NovaCorePaymentEvent *)event order:(NovaCorePayOrder *)order __attribute__((swift_name("onProcessEvent(event:order:)")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)promoteUserInteractionReason:(NovaCoreKotlinThrowable *)reason order:(NovaCorePayOrder *)order __attribute__((swift_name("promoteUserInteraction(reason:order:)")));
- (void)promptToastType:(NovaCorePaymentProcessToastType *)type order:(NovaCorePayOrder *)order __attribute__((swift_name("promptToast(type:order:)")));
- (NovaCorePromiseInterface<NovaCorePayOrder *> *)startPurchaseOrder:(NovaCorePayOrder *)order __attribute__((swift_name("startPurchase(order:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DeliveryStatus")))
@interface NovaCoreDeliveryStatus : NovaCoreKotlinEnum<NovaCoreDeliveryStatus *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreDeliveryStatusCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreDeliveryStatus *success __attribute__((swift_name("success")));
@property (class, readonly) NovaCoreDeliveryStatus *pending __attribute__((swift_name("pending")));
@property (class, readonly) NovaCoreDeliveryStatus *failed __attribute__((swift_name("failed")));
+ (NovaCoreKotlinArray<NovaCoreDeliveryStatus *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreDeliveryStatus *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DeliveryStatus.Companion")))
@interface NovaCoreDeliveryStatusCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreDeliveryStatusCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreDeliveryStatus *)getEnumByValueNeedle:(NSString *)needle __attribute__((swift_name("getEnumByValue(needle:)")));
@property (readonly) NSArray<NSString *> *failureCodes __attribute__((swift_name("failureCodes")));
@property (readonly) NSArray<NSString *> *successCodes __attribute__((swift_name("successCodes")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OrderPayLoad")))
@interface NovaCoreOrderPayLoad : NovaCoreBase
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithPlayerId:(NSString *)playerId roleId:(NSString *)roleId __attribute__((swift_name("init(playerId:roleId:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreOrderPayLoadCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreOrderPayLoad *)doCopyPlayerId:(NSString *)playerId roleId:(NSString *)roleId __attribute__((swift_name("doCopy(playerId:roleId:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NSString *playerId __attribute__((swift_name("playerId")));
@property NSString *roleId __attribute__((swift_name("roleId")));
@property NSString *serverId __attribute__((swift_name("serverId")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OrderPayLoad.Companion")))
@interface NovaCoreOrderPayLoadCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreOrderPayLoadCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreOrderPayLoad * _Nullable)getInstanceFromJsonJson:(NSDictionary<NSString *, NovaCoreKotlinx_serialization_jsonJsonElement *> * _Nullable)json __attribute__((swift_name("getInstanceFromJson(json:)")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OwnerType")))
@interface NovaCoreOwnerType : NovaCoreKotlinEnum<NovaCoreOwnerType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreOwnerTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreOwnerType *ios __attribute__((swift_name("ios")));
@property (class, readonly) NovaCoreOwnerType *google __attribute__((swift_name("google")));
@property (class, readonly) NovaCoreOwnerType *flexion __attribute__((swift_name("flexion")));
@property (class, readonly) NovaCoreOwnerType *unknown __attribute__((swift_name("unknown")));
+ (NovaCoreKotlinArray<NovaCoreOwnerType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreOwnerType *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *typeName __attribute__((swift_name("typeName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OwnerType.Companion")))
@interface NovaCoreOwnerTypeCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreOwnerTypeCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreOwnerType *)getEnumByValueNeedle:(NSString *)needle __attribute__((swift_name("getEnumByValue(needle:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PayOrder")))
@interface NovaCorePayOrder : NovaCoreBase
- (instancetype)initWithProductId:(NSString *)productId orderId:(NSString *)orderId __attribute__((swift_name("init(productId:orderId:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCorePayOrderCompanion *companion __attribute__((swift_name("companion")));
- (NovaCorePayOrder *)doCopyProductId:(NSString *)productId orderId:(NSString *)orderId __attribute__((swift_name("doCopy(productId:orderId:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSString *)getProductType __attribute__((swift_name("getProductType()")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="created_time")
*/
@property int32_t createdTime __attribute__((swift_name("createdTime")));
@property NovaCoreDeliveryStatus *deliveryStatus __attribute__((swift_name("deliveryStatus")));
@property NSString *inAppExternalUrl __attribute__((swift_name("inAppExternalUrl")));
@property BOOL isAcknowledged __attribute__((swift_name("isAcknowledged")));
@property BOOL isAuditPeriodOrder __attribute__((swift_name("isAuditPeriodOrder")));
@property BOOL isOldOrder __attribute__((swift_name("isOldOrder")));
@property (readonly) BOOL isSubs __attribute__((swift_name("isSubs")));
@property NSString *message __attribute__((swift_name("message")));
@property NSString *oldOrderId __attribute__((swift_name("oldOrderId")));
@property NSString *orderId __attribute__((swift_name("orderId")));
@property NSString *originalJson __attribute__((swift_name("originalJson")));
@property NovaCoreOwnerType *ownerType __attribute__((swift_name("ownerType")));
@property NovaCoreOrderPayLoad * _Nullable payLoad __attribute__((swift_name("payLoad")));
@property (readonly) NSString *persistentKey __attribute__((swift_name("persistentKey")));
@property double productAmount __attribute__((swift_name("productAmount")));
@property NSString *productCurrency __attribute__((swift_name("productCurrency")));
@property NSString *productDescription __attribute__((swift_name("productDescription")));
@property NSString *productId __attribute__((swift_name("productId")));
@property NSString *productTitle __attribute__((swift_name("productTitle")));
@property NSString *purchaseId __attribute__((swift_name("purchaseId")));
@property NovaCorePurchaseStatus *purchaseStatus __attribute__((swift_name("purchaseStatus")));
@property NSString *purchaseTime __attribute__((swift_name("purchaseTime")));
@property NSString *purchaseToken __attribute__((swift_name("purchaseToken")));
@property NSString *roleId __attribute__((swift_name("roleId")));
@property NSString *roleName __attribute__((swift_name("roleName")));
@property (readonly) NSString *serialized __attribute__((swift_name("serialized")));
@property NSString *serverId __attribute__((swift_name("serverId")));
@property NSString *signature __attribute__((swift_name("signature")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PayOrder.Companion")))
@interface NovaCorePayOrderCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePayOrderCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentEvent")))
@interface NovaCorePaymentEvent : NovaCoreKotlinEnum<NovaCorePaymentEvent *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCorePaymentEvent *placeOrderStart __attribute__((swift_name("placeOrderStart")));
@property (class, readonly) NovaCorePaymentEvent *placeOrderDone __attribute__((swift_name("placeOrderDone")));
@property (class, readonly) NovaCorePaymentEvent *purchaseStart __attribute__((swift_name("purchaseStart")));
@property (class, readonly) NovaCorePaymentEvent *purchaseDone __attribute__((swift_name("purchaseDone")));
@property (class, readonly) NovaCorePaymentEvent *orderVerificationStart __attribute__((swift_name("orderVerificationStart")));
@property (class, readonly) NovaCorePaymentEvent *orderVerificationDone __attribute__((swift_name("orderVerificationDone")));
@property (class, readonly) NovaCorePaymentEvent *checkDeliveryStatusStart __attribute__((swift_name("checkDeliveryStatusStart")));
@property (class, readonly) NovaCorePaymentEvent *checkDeliveryStatusDone __attribute__((swift_name("checkDeliveryStatusDone")));
+ (NovaCoreKotlinArray<NovaCorePaymentEvent *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePaymentEvent *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentProcessToastType")))
@interface NovaCorePaymentProcessToastType : NovaCoreKotlinEnum<NovaCorePaymentProcessToastType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCorePaymentProcessToastType *findUncompletedOrder __attribute__((swift_name("findUncompletedOrder")));
@property (class, readonly) NovaCorePaymentProcessToastType *purchasedStatusPending __attribute__((swift_name("purchasedStatusPending")));
@property (class, readonly) NovaCorePaymentProcessToastType *purchasedStatusPendingOld __attribute__((swift_name("purchasedStatusPendingOld")));
@property (class, readonly) NovaCorePaymentProcessToastType *acknowledgedFailed __attribute__((swift_name("acknowledgedFailed")));
@property (class, readonly) NovaCorePaymentProcessToastType *acknowledgedFailedOld __attribute__((swift_name("acknowledgedFailedOld")));
@property (class, readonly) NovaCorePaymentProcessToastType *verifyFailed __attribute__((swift_name("verifyFailed")));
@property (class, readonly) NovaCorePaymentProcessToastType *verifyFailedOld __attribute__((swift_name("verifyFailedOld")));
@property (class, readonly) NovaCorePaymentProcessToastType *consumeSuccessContinue __attribute__((swift_name("consumeSuccessContinue")));
@property (class, readonly) NovaCorePaymentProcessToastType *consumeFailedConnectCustomer __attribute__((swift_name("consumeFailedConnectCustomer")));
+ (NovaCoreKotlinArray<NovaCorePaymentProcessToastType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePaymentProcessToastType *> *entries __attribute__((swift_name("entries")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlaceOrderResult")))
@interface NovaCorePlaceOrderResult : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithElement:(NovaCoreKotlinx_serialization_jsonJsonElement *)element __attribute__((swift_name("init(element:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCorePlaceOrderResultCompanion *companion __attribute__((swift_name("companion")));
@property NSString *externalUrl __attribute__((swift_name("externalUrl")));
@property NSString *orderId __attribute__((swift_name("orderId")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlaceOrderResult.Companion")))
@interface NovaCorePlaceOrderResultCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePlaceOrderResultCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ProcessToastType")))
@interface NovaCoreProcessToastType : NovaCoreKotlinEnum<NovaCoreProcessToastType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreProcessToastType *findUncompletedOrder __attribute__((swift_name("findUncompletedOrder")));
@property (class, readonly) NovaCoreProcessToastType *purchasedStatusPending __attribute__((swift_name("purchasedStatusPending")));
@property (class, readonly) NovaCoreProcessToastType *purchasedStatusPendingOld __attribute__((swift_name("purchasedStatusPendingOld")));
@property (class, readonly) NovaCoreProcessToastType *acknowledgedFailed __attribute__((swift_name("acknowledgedFailed")));
@property (class, readonly) NovaCoreProcessToastType *acknowledgedFailedOld __attribute__((swift_name("acknowledgedFailedOld")));
@property (class, readonly) NovaCoreProcessToastType *verifyFailed __attribute__((swift_name("verifyFailed")));
@property (class, readonly) NovaCoreProcessToastType *verifyFailedOld __attribute__((swift_name("verifyFailedOld")));
@property (class, readonly) NovaCoreProcessToastType *consumeSuccessContinue __attribute__((swift_name("consumeSuccessContinue")));
@property (class, readonly) NovaCoreProcessToastType *consumeFailedConnectCustomer __attribute__((swift_name("consumeFailedConnectCustomer")));
+ (NovaCoreKotlinArray<NovaCoreProcessToastType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreProcessToastType *> *entries __attribute__((swift_name("entries")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ProductInfo")))
@interface NovaCoreProductInfo : NovaCoreBase
- (instancetype)initWithProductId:(NSString *)productId __attribute__((swift_name("init(productId:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCoreProductInfoCompanion *companion __attribute__((swift_name("companion")));
- (NovaCoreProductInfo *)doCopyProductId:(NSString *)productId __attribute__((swift_name("doCopy(productId:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (BOOL)isSubs __attribute__((swift_name("isSubs()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property double amount __attribute__((swift_name("amount")));
@property NSString *currency __attribute__((swift_name("currency")));
@property (setter=setDescription:) NSString *description_ __attribute__((swift_name("description_")));
@property NSString *price __attribute__((swift_name("price")));
@property NSString *productId __attribute__((swift_name("productId")));
@property NSString *title __attribute__((swift_name("title")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ProductInfo.Companion")))
@interface NovaCoreProductInfoCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreProductInfoCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ProductType")))
@interface NovaCoreProductType : NovaCoreKotlinEnum<NovaCoreProductType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreProductTypeCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreProductType *consumable __attribute__((swift_name("consumable")));
@property (class, readonly) NovaCoreProductType *rss __attribute__((swift_name("rss")));
+ (NovaCoreKotlinArray<NovaCoreProductType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreProductType *> *entries __attribute__((swift_name("entries")));
@property NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ProductType.Companion")))
@interface NovaCoreProductTypeCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreProductTypeCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreProductType *)getEnumByValueNeedle:(NSString *)needle __attribute__((swift_name("getEnumByValue(needle:)")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(NovaCoreKotlinArray<id<NovaCoreKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PurchaseEvent")))
@interface NovaCorePurchaseEvent : NovaCoreKotlinEnum<NovaCorePurchaseEvent *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCorePurchaseEvent *purchased __attribute__((swift_name("purchased")));
@property (class, readonly) NovaCorePurchaseEvent *delivered __attribute__((swift_name("delivered")));
+ (NovaCoreKotlinArray<NovaCorePurchaseEvent *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePurchaseEvent *> *entries __attribute__((swift_name("entries")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PurchaseResult")))
@interface NovaCorePurchaseResult : NovaCoreBase
- (instancetype)initWithOrderId:(NSString *)orderId __attribute__((swift_name("init(orderId:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCorePurchaseResultCompanion *companion __attribute__((swift_name("companion")));
- (NovaCorePurchaseResult *)doCopyOrderId:(NSString *)orderId __attribute__((swift_name("doCopy(orderId:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property NovaCoreDeliveryStatus *deliveryStatus __attribute__((swift_name("deliveryStatus")));
@property NSString *orderId __attribute__((swift_name("orderId")));
@property NSString *productId __attribute__((swift_name("productId")));
@property NSString *purchaseId __attribute__((swift_name("purchaseId")));
@property NovaCorePurchaseStatus *purchaseStatus __attribute__((swift_name("purchaseStatus")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PurchaseResult.Companion")))
@interface NovaCorePurchaseResultCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePurchaseResultCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PurchaseStatus")))
@interface NovaCorePurchaseStatus : NovaCoreKotlinEnum<NovaCorePurchaseStatus *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCorePurchaseStatusCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCorePurchaseStatus *purchased __attribute__((swift_name("purchased")));
@property (class, readonly) NovaCorePurchaseStatus *cancelled __attribute__((swift_name("cancelled")));
@property (class, readonly) NovaCorePurchaseStatus *failed __attribute__((swift_name("failed")));
@property (class, readonly) NovaCorePurchaseStatus *pending __attribute__((swift_name("pending")));
@property (class, readonly) NovaCorePurchaseStatus *other __attribute__((swift_name("other")));
+ (NovaCoreKotlinArray<NovaCorePurchaseStatus *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePurchaseStatus *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *status __attribute__((swift_name("status")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PurchaseStatus.Companion")))
@interface NovaCorePurchaseStatusCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePurchaseStatusCompanion *shared __attribute__((swift_name("shared")));
- (NovaCorePurchaseStatus *)getEnumByValueNeedle:(NSString *)needle __attribute__((swift_name("getEnumByValue(needle:)")));
@property (readonly) NSArray<NSString *> *cancelCodes __attribute__((swift_name("cancelCodes")));
@property (readonly) NSArray<NSString *> *failureCodes __attribute__((swift_name("failureCodes")));
@property (readonly) NSArray<NSString *> *successCodes __attribute__((swift_name("successCodes")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("VerifyStatus")))
@interface NovaCoreVerifyStatus : NovaCoreKotlinEnum<NovaCoreVerifyStatus *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) NovaCoreVerifyStatusCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) NovaCoreVerifyStatus *success __attribute__((swift_name("success")));
@property (class, readonly) NovaCoreVerifyStatus *failed __attribute__((swift_name("failed")));
@property (class, readonly) NovaCoreVerifyStatus *couldRetry __attribute__((swift_name("couldRetry")));
+ (NovaCoreKotlinArray<NovaCoreVerifyStatus *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreVerifyStatus *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("VerifyStatus.Companion")))
@interface NovaCoreVerifyStatusCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreVerifyStatusCompanion *shared __attribute__((swift_name("shared")));
- (NovaCoreVerifyStatus *)getEnumByValueNeedle:(NSString *)needle __attribute__((swift_name("getEnumByValue(needle:)")));
@property (readonly) NSArray<NSString *> *couldRetryCodes __attribute__((swift_name("couldRetryCodes")));
@property (readonly) NSArray<NSString *> *successCodes __attribute__((swift_name("successCodes")));
@end

__attribute__((swift_name("KotlinThrowable")))
@interface NovaCoreKotlinThrowable : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));

/**
 * @note annotations
 *   kotlin.experimental.ExperimentalNativeApi
*/
- (NovaCoreKotlinArray<NSString *> *)getStackTrace __attribute__((swift_name("getStackTrace()")));
- (void)printStackTrace __attribute__((swift_name("printStackTrace()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NovaCoreKotlinThrowable * _Nullable cause __attribute__((swift_name("cause")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
- (NSError *)asError __attribute__((swift_name("asError()")));
@end

__attribute__((swift_name("CheckDeliveryResultFailReason")))
@interface NovaCoreCheckDeliveryResultFailReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((swift_name("KotlinError")))
@interface NovaCoreKotlinError : NovaCoreKotlinThrowable
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((swift_name("InvalidPayTypeError")))
@interface NovaCoreInvalidPayTypeError : NovaCoreKotlinError
- (instancetype)initWithMessage:(NSString *)message code:(int32_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) int32_t code __attribute__((swift_name("code")));
@property (readonly) NSString *message __attribute__((swift_name("message")));
@end

__attribute__((swift_name("PaymentBaseReason")))
@interface NovaCorePaymentBaseReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message code:(int32_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) int32_t code __attribute__((swift_name("code")));
@end

__attribute__((swift_name("PaymentBlockReason")))
@interface NovaCorePaymentBlockReason : NovaCorePaymentBaseReason
- (instancetype)initWithMessage:(NSString *)message code:(int32_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((swift_name("RepaymentReason")))
@interface NovaCoreRepaymentReason : NovaCorePaymentBaseReason
- (instancetype)initWithMessage:(NSString *)message code:(int32_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((swift_name("UnknownReason")))
@interface NovaCoreUnknownReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((swift_name("VerifyOrderFailReason")))
@interface NovaCoreVerifyOrderFailReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromptReason")))
@interface NovaCorePromptReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdErrorReason")))
@interface NovaCoreAdErrorReason : NovaCoreKotlinThrowable
- (instancetype)initWithErrorType:(NSString *)errorType message:(NSString *)message __attribute__((swift_name("init(errorType:message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NSString *errorType __attribute__((swift_name("errorType")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("BadResponseReason")))
@interface NovaCoreBadResponseReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CredentialExpiredReason")))
@interface NovaCoreCredentialExpiredReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CredentialMismatchReason")))
@interface NovaCoreCredentialMismatchReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DeviceBlockReason")))
@interface NovaCoreDeviceBlockReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message token:(NSString *)token __attribute__((swift_name("init(message:token:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("HHGamesUnRealNameReason")))
@interface NovaCoreHHGamesUnRealNameReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("HttpErrorReason")))
@interface NovaCoreHttpErrorReason : NovaCoreKotlinThrowable
- (instancetype)initWithStatusCode:(int32_t)statusCode message:(NSString *)message body:(NSString *)body __attribute__((swift_name("init(statusCode:message:body:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NSString *body __attribute__((swift_name("body")));
@property (readonly) int32_t statusCode __attribute__((swift_name("statusCode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IPBlockReason")))
@interface NovaCoreIPBlockReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message token:(NSString *)token __attribute__((swift_name("init(message:token:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidResponseReason")))
@interface NovaCoreInvalidResponseReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("NetworkErrorReason")))
@interface NovaCoreNetworkErrorReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("NoLoginHistoryReason")))
@interface NovaCoreNoLoginHistoryReason : NovaCoreKotlinThrowable
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("NoResponseReason")))
@interface NovaCoreNoResponseReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OrderStatusPending")))
@interface NovaCoreOrderStatusPending : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message code:(int32_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) int32_t code __attribute__((swift_name("code")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentAntiIndulgedReason")))
@interface NovaCorePaymentAntiIndulgedReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((swift_name("PaymentBaseReason_")))
@interface NovaCorePaymentBaseReason_ : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message code:(int32_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) int32_t code __attribute__((swift_name("code")));
@end

__attribute__((swift_name("PaymentBlockReason_")))
@interface NovaCorePaymentBlockReason_ : NovaCorePaymentBaseReason
- (instancetype)initWithMessage:(NSString *)message code:(int32_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerAlreadyExistReason")))
@interface NovaCorePlayerAlreadyExistReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerAppliedDeregisterReason")))
@interface NovaCorePlayerAppliedDeregisterReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerBlockReason")))
@interface NovaCorePlayerBlockReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message token:(NSString *)token __attribute__((swift_name("init(message:token:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NSString *token __attribute__((swift_name("token")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerDeregisteredReason")))
@interface NovaCorePlayerDeregisteredReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerFrozenReason")))
@interface NovaCorePlayerFrozenReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerHaveRefdReason")))
@interface NovaCorePlayerHaveRefdReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerHaveSubsReason")))
@interface NovaCorePlayerHaveSubsReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerTokenInvalidReason")))
@interface NovaCorePlayerTokenInvalidReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerWarningReason")))
@interface NovaCorePlayerWarningReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RefreshTokenInvalidReason")))
@interface NovaCoreRefreshTokenInvalidReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ThirdPartyVerificationFailureReason")))
@interface NovaCoreThirdPartyVerificationFailureReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UserCancelledReason")))
@interface NovaCoreUserCancelledReason : NovaCoreKotlinThrowable
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UserNotExistReason")))
@interface NovaCoreUserNotExistReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UuidNonidenticalReason")))
@interface NovaCoreUuidNonidenticalReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("VerificationCodeInvalidReason")))
@interface NovaCoreVerificationCodeInvalidReason : NovaCoreKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ApiStatusCode")))
@interface NovaCoreApiStatusCode : NovaCoreKotlinEnum<NovaCoreApiStatusCode *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreApiStatusCode *httpNoResponse __attribute__((swift_name("httpNoResponse")));
@property (class, readonly) NovaCoreApiStatusCode *httpBadResponse __attribute__((swift_name("httpBadResponse")));
@property (class, readonly) NovaCoreApiStatusCode *httpNetworkError __attribute__((swift_name("httpNetworkError")));
@property (class, readonly) NovaCoreApiStatusCode *loginUserNotExist __attribute__((swift_name("loginUserNotExist")));
@property (class, readonly) NovaCoreApiStatusCode *uuidNonidentical __attribute__((swift_name("uuidNonidentical")));
@property (class, readonly) NovaCoreApiStatusCode *connectToExistPlayer __attribute__((swift_name("connectToExistPlayer")));
@property (class, readonly) NovaCoreApiStatusCode *thirdPartyLoginError __attribute__((swift_name("thirdPartyLoginError")));
@property (class, readonly) NovaCoreApiStatusCode *registerUserAlreadyExist __attribute__((swift_name("registerUserAlreadyExist")));
@property (class, readonly) NovaCoreApiStatusCode *playerTokenInvalid __attribute__((swift_name("playerTokenInvalid")));
@property (class, readonly) NovaCoreApiStatusCode *deviceBlock __attribute__((swift_name("deviceBlock")));
@property (class, readonly) NovaCoreApiStatusCode *playerBlock __attribute__((swift_name("playerBlock")));
@property (class, readonly) NovaCoreApiStatusCode *refreshTokenInvalid __attribute__((swift_name("refreshTokenInvalid")));
@property (class, readonly) NovaCoreApiStatusCode *verificationCodeInvalid __attribute__((swift_name("verificationCodeInvalid")));
@property (class, readonly) NovaCoreApiStatusCode *ipBlock __attribute__((swift_name("ipBlock")));
@property (class, readonly) NovaCoreApiStatusCode *playerHaveRefd __attribute__((swift_name("playerHaveRefd")));
@property (class, readonly) NovaCoreApiStatusCode *playerDeregistered __attribute__((swift_name("playerDeregistered")));
@property (class, readonly) NovaCoreApiStatusCode *playerHaveSubs __attribute__((swift_name("playerHaveSubs")));
+ (NovaCoreKotlinArray<NovaCoreApiStatusCode *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreApiStatusCode *> *entries __attribute__((swift_name("entries")));
@property (readonly) int32_t code __attribute__((swift_name("code")));
@end

__attribute__((swift_name("BaseEvent")))
@interface NovaCoreBaseEvent : NovaCoreBase
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@end

__attribute__((swift_name("BaseService")))
@interface NovaCoreBaseService : NovaCoreEngineService
- (instancetype)initWithHttpEngine:(id<NovaCoreRestfulHttpEngine>)httpEngine __attribute__((swift_name("init(httpEngine:)"))) __attribute__((objc_designated_initializer));
- (NovaCorePromiseInterface<NovaCoreKotlinx_serialization_jsonJsonElement *> *)requestApiPath:(NSString *)path postData:(NSDictionary<NSString *, NSString *> *)postData reqMethod:(NovaCoreHttpMethod *)reqMethod timeoutMillis:(int64_t)timeoutMillis host:(NSString *)host rootPath:(NSString *)rootPath headers:(NSDictionary<NSString *, NSString *> *)headers __attribute__((swift_name("requestApi(path:postData:reqMethod:timeoutMillis:host:rootPath:headers:)")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerializationStrategy")))
@protocol NovaCoreKotlinx_serialization_coreSerializationStrategy
@required
- (void)serializeEncoder:(id<NovaCoreKotlinx_serialization_coreEncoder>)encoder value:(id _Nullable)value __attribute__((swift_name("serialize(encoder:value:)")));
@property (readonly) id<NovaCoreKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreDeserializationStrategy")))
@protocol NovaCoreKotlinx_serialization_coreDeserializationStrategy
@required
- (id _Nullable)deserializeDecoder:(id<NovaCoreKotlinx_serialization_coreDecoder>)decoder __attribute__((swift_name("deserialize(decoder:)")));
@property (readonly) id<NovaCoreKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreKSerializer")))
@protocol NovaCoreKotlinx_serialization_coreKSerializer <NovaCoreKotlinx_serialization_coreSerializationStrategy, NovaCoreKotlinx_serialization_coreDeserializationStrategy>
@required
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("NullableParametersSerializer")))
@interface NovaCoreNullableParametersSerializer : NovaCoreBase <NovaCoreKotlinx_serialization_coreKSerializer>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)nullableParametersSerializer __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreNullableParametersSerializer *shared __attribute__((swift_name("shared")));
- (NSString *)deserializeDecoder:(id<NovaCoreKotlinx_serialization_coreDecoder>)decoder __attribute__((swift_name("deserialize(decoder:)")));
- (void)serializeEncoder:(id<NovaCoreKotlinx_serialization_coreEncoder>)encoder value:(NSString * _Nullable)value __attribute__((swift_name("serialize(encoder:value:)")));
@property (readonly) id<NovaCoreKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentApiStatusCode")))
@interface NovaCorePaymentApiStatusCode : NovaCoreKotlinEnum<NovaCorePaymentApiStatusCode *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCorePaymentApiStatusCode *pendingCode __attribute__((swift_name("pendingCode")));
+ (NovaCoreKotlinArray<NovaCorePaymentApiStatusCode *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePaymentApiStatusCode *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSArray<NovaCoreInt *> *range __attribute__((swift_name("range")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentOptionalParams")))
@interface NovaCorePaymentOptionalParams : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithGameExtent:(NSString *)gameExtent __attribute__((swift_name("init(gameExtent:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) NovaCorePaymentOptionalParamsCompanion *companion __attribute__((swift_name("companion")));
- (NSString *)description __attribute__((swift_name("description()")));

/**
 * @note annotations
 *   kotlinx.serialization.Serializable(with=NormalClass(value=com/nova/core/service/NullableParametersSerializer))
 *   kotlinx.serialization.SerialName(value="gameExt")
*/
@property NSString * _Nullable gameExt __attribute__((swift_name("gameExt")));

/**
 * @note annotations
 *   kotlinx.serialization.SerialName(value="packageName")
*/
@property NSString *packageName __attribute__((swift_name("packageName")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PaymentOptionalParams.Companion")))
@interface NovaCorePaymentOptionalParamsCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePaymentOptionalParamsCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ReasonEvent")))
@interface NovaCoreReasonEvent : NovaCoreBaseEvent
- (instancetype)initWithReason:(NovaCoreKotlinThrowable *)reason __attribute__((swift_name("init(reason:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithName:(NSString *)name __attribute__((swift_name("init(name:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NovaCoreKotlinThrowable *reason __attribute__((swift_name("reason")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ReasonEventHub")))
@interface NovaCoreReasonEventHub<observer> : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)addRun:(void (^)(observer))run __attribute__((swift_name("add(run:)")));
- (void)postEvent:(observer)event __attribute__((swift_name("post(event:)")));
@end

__attribute__((swift_name("ResponsePromise")))
@interface NovaCoreResponsePromise : NovaCorePromise<NovaCoreKotlinx_serialization_jsonJsonElement *>
- (instancetype)initWithWaitFor:(NovaCoreWaitable * _Nullable)waitFor __attribute__((swift_name("init(waitFor:)"))) __attribute__((objc_designated_initializer));
- (void)exceptionResponseContentHandlerResponseBody:(NSString *)responseBody __attribute__((swift_name("exceptionResponseContentHandler(responseBody:)")));
- (void)handleErrorReason:(NovaCoreKotlinThrowable *)reason __attribute__((swift_name("handleError(reason:)")));
- (void)handleResponseResponse:(NovaCoreRestfulHttpResponse *)response __attribute__((swift_name("handleResponse(response:)")));
- (void)rejectReason:(NovaCoreKotlinThrowable *)reason __attribute__((swift_name("reject(reason:)")));
@end

__attribute__((swift_name("ReadonlyKVStorage")))
@protocol NovaCoreReadonlyKVStorage
@required
- (NSString *)getKey:(NSString *)key __attribute__((swift_name("get(key:)")));
@end

__attribute__((swift_name("MutableKVStorage")))
@protocol NovaCoreMutableKVStorage <NovaCoreReadonlyKVStorage>
@required
- (NovaCoreKotlinArray<NSString *> *)allKeys __attribute__((swift_name("allKeys()")));
- (void)removeKey:(NSString *)key __attribute__((swift_name("remove(key:)")));
- (void)setKey:(NSString *)key data:(NSString *)data __attribute__((swift_name("set(key:data:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey")))
@interface NovaCorePackageSettingsKey : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)packageSettingsKey __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKey *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *APPLE_APP_ID __attribute__((swift_name("APPLE_APP_ID")));
@property (readonly) NSString *DEVELOPER_ENVIRONMENT __attribute__((swift_name("DEVELOPER_ENVIRONMENT")));
@property (readonly) NSString *DEVELOPER_MODE __attribute__((swift_name("DEVELOPER_MODE")));
@property (readonly) NSString *GAME_CODE __attribute__((swift_name("GAME_CODE")));
@property (readonly) NSString *MANUFACTURER __attribute__((swift_name("MANUFACTURER")));
@property (readonly) NSString *NETWORK_CLIENT_IP __attribute__((swift_name("NETWORK_CLIENT_IP")));
@property (readonly) NSString *NETWORK_ENVIRONMENT __attribute__((swift_name("NETWORK_ENVIRONMENT")));
@property (readonly) NSString *NETWORK_OPERATOR __attribute__((swift_name("NETWORK_OPERATOR")));
@property (readonly) NSString *REGIONAL_AGENT __attribute__((swift_name("REGIONAL_AGENT")));
@property (readonly) NSString *REGION_CODE __attribute__((swift_name("REGION_CODE")));
@property (readonly) NSString *SCREEN __attribute__((swift_name("SCREEN")));
@property (readonly) NSString *SDK_TAG __attribute__((swift_name("SDK_TAG")));
@property (readonly) NSString *SF_CODE __attribute__((swift_name("SF_CODE")));
@property (readonly) NSString *S_CODE __attribute__((swift_name("S_CODE")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Adjust")))
@interface NovaCorePackageSettingsKeyAdjust : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)adjust __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyAdjust *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *ADID __attribute__((swift_name("ADID")));
@property (readonly) NSString *APP_TOKEN __attribute__((swift_name("APP_TOKEN")));
@property (readonly) NSString *DEFAULT_TRACKER __attribute__((swift_name("DEFAULT_TRACKER")));
@property (readonly) NSString *GPS_ADID __attribute__((swift_name("GPS_ADID")));
@property (readonly) NSString *IDFA __attribute__((swift_name("IDFA")));
@property (readonly) NSString *IDFV __attribute__((swift_name("IDFV")));
@property (readonly) NSString *INFO1 __attribute__((swift_name("INFO1")));
@property (readonly) NSString *INFO2 __attribute__((swift_name("INFO2")));
@property (readonly) NSString *INFO3 __attribute__((swift_name("INFO3")));
@property (readonly) NSString *INFO4 __attribute__((swift_name("INFO4")));
@property (readonly) NSString *SECRET_ID __attribute__((swift_name("SECRET_ID")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Admob")))
@interface NovaCorePackageSettingsKeyAdmob : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)admob __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyAdmob *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *APP_ID __attribute__((swift_name("APP_ID")));
@property (readonly) NSString *APP_OPEN_UNIT_ID __attribute__((swift_name("APP_OPEN_UNIT_ID")));
@property (readonly) NSString *UNIT_ID __attribute__((swift_name("UNIT_ID")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Applovin")))
@interface NovaCorePackageSettingsKeyApplovin : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)applovin __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyApplovin *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *APP_OPEN_UNIT_ID __attribute__((swift_name("APP_OPEN_UNIT_ID")));
@property (readonly) NSString *MAX_SDK_KEY __attribute__((swift_name("MAX_SDK_KEY")));
@property (readonly) NSString *MAX_UNIT_ID __attribute__((swift_name("MAX_UNIT_ID")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Client")))
@interface NovaCorePackageSettingsKeyClient : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)client __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyClient *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *ADID __attribute__((swift_name("ADID")));
@property (readonly) NSString *ANDROIDID __attribute__((swift_name("ANDROIDID")));
@property (readonly) NSString *CLIENT_BUILD_VERSION __attribute__((swift_name("CLIENT_BUILD_VERSION")));
@property (readonly) NSString *CLIENT_VERSION __attribute__((swift_name("CLIENT_VERSION")));
@property (readonly) NSString *DEVICE_BRAND __attribute__((swift_name("DEVICE_BRAND")));
@property (readonly) NSString *DEVICE_ID __attribute__((swift_name("DEVICE_ID")));
@property (readonly) NSString *DEVICE_MODEL __attribute__((swift_name("DEVICE_MODEL")));
@property (readonly) NSString *IDFA __attribute__((swift_name("IDFA")));
@property (readonly) NSString *IDFV __attribute__((swift_name("IDFV")));
@property (readonly) NSString *JAILBREAK __attribute__((swift_name("JAILBREAK")));
@property (readonly) NSString *OS __attribute__((swift_name("OS")));
@property (readonly) NSString *OS_VERSION __attribute__((swift_name("OS_VERSION")));
@property (readonly) NSString *PACKAGE_NAME __attribute__((swift_name("PACKAGE_NAME")));
@property (readonly) NSString *PACKAGE_VERSION __attribute__((swift_name("PACKAGE_VERSION")));
@property (readonly) NSString *SDK_VERSION __attribute__((swift_name("SDK_VERSION")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Dma")))
@interface NovaCorePackageSettingsKeyDma : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)dma __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyDma *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *DMA_APP_ID __attribute__((swift_name("DMA_APP_ID")));
@property (readonly) NSString *DMA_DOMAIN __attribute__((swift_name("DMA_DOMAIN")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Facebook")))
@interface NovaCorePackageSettingsKeyFacebook : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)facebook __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyFacebook *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *APP_ID __attribute__((swift_name("APP_ID")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Firebase")))
@interface NovaCorePackageSettingsKeyFirebase : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)firebase __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyFirebase *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *APP_INSTANCE_ID __attribute__((swift_name("APP_INSTANCE_ID")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.HHGame")))
@interface NovaCorePackageSettingsKeyHHGame : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)hHGame __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyHHGame *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *TOKEN __attribute__((swift_name("TOKEN")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Kakao")))
@interface NovaCorePackageSettingsKeyKakao : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)kakao __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyKakao *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *APP_KEY __attribute__((swift_name("APP_KEY")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.Line")))
@interface NovaCorePackageSettingsKeyLine : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)line __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyLine *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *CHANNEL_ID __attribute__((swift_name("CHANNEL_ID")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.SoBot")))
@interface NovaCorePackageSettingsKeySoBot : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)soBot __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeySoBot *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *APP_KEY __attribute__((swift_name("APP_KEY")));
@property (readonly) NSString *HOST __attribute__((swift_name("HOST")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PackageSettingsKey.TD")))
@interface NovaCorePackageSettingsKeyTD : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)tD __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePackageSettingsKeyTD *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *TD_APP_ID __attribute__((swift_name("TD_APP_ID")));
@property (readonly) NSString *TD_DISTINCT_ID __attribute__((swift_name("TD_DISTINCT_ID")));
@property (readonly) NSString *TD_SERVER_URL __attribute__((swift_name("TD_SERVER_URL")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PersistentKey")))
@interface NovaCorePersistentKey : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)persistentKey __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePersistentKey *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *AD_REVENUE_CACHE __attribute__((swift_name("AD_REVENUE_CACHE")));
@property (readonly) NSString *AGE_SIGNALS_CACHE_TIME __attribute__((swift_name("AGE_SIGNALS_CACHE_TIME")));
@property (readonly) NSString *APP_OPEN_AD_LIMIT_TIMESTAMP __attribute__((swift_name("APP_OPEN_AD_LIMIT_TIMESTAMP")));
@property (readonly) NSString *CURRENT_DEVICE_IS_FIRST_LOGIN __attribute__((swift_name("CURRENT_DEVICE_IS_FIRST_LOGIN")));
@property (readonly) NSString *CURRENT_DEVICE_IS_SHOW_DMA __attribute__((swift_name("CURRENT_DEVICE_IS_SHOW_DMA")));
@property (readonly) NSString *CURRENT_DEVICE_IS_SHOW_TP __attribute__((swift_name("CURRENT_DEVICE_IS_SHOW_TP")));
@property (readonly) NSString *CURRENT_DEVICE_TIMESTAMP __attribute__((swift_name("CURRENT_DEVICE_TIMESTAMP")));
@property (readonly) NSString *FIRST_INIT_TIME __attribute__((swift_name("FIRST_INIT_TIME")));
@property (readonly) NSString *HOST_IPS_KEY __attribute__((swift_name("HOST_IPS_KEY")));
@property (readonly) NSString *LAST_LOGIN_TIME_FOR_DEVICE __attribute__((swift_name("LAST_LOGIN_TIME_FOR_DEVICE")));
@property (readonly) NSString *ONLINE_DATA __attribute__((swift_name("ONLINE_DATA")));
@property (readonly) NSString *PRIORITY_ACCEPT_POLICY __attribute__((swift_name("PRIORITY_ACCEPT_POLICY")));
@property (readonly) NSString *REMOTE_GAME_CONFIG __attribute__((swift_name("REMOTE_GAME_CONFIG")));
@property (readonly) NSString *THIRD_PARTY_TOKENS __attribute__((swift_name("THIRD_PARTY_TOKENS")));
@property (readonly) NSString *TOKEN_DATA __attribute__((swift_name("TOKEN_DATA")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromptTaskQueue")))
@interface NovaCorePromptTaskQueue : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (NovaCorePromiseInterface<id> *)executeAsyncTaskName:(NSString *)name level:(NovaCorePromptTaskQueueTaskLevel *)level task:(NovaCorePromiseInterface<id> *(^)(void))task __attribute__((swift_name("executeAsyncTask(name:level:task:)")));
- (id _Nullable)executeSyncTaskTask:(id _Nullable (^)(void))task __attribute__((swift_name("executeSyncTask(task:)")));
- (void)resetAll __attribute__((swift_name("resetAll()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromptTaskQueue.PromptTask")))
@interface NovaCorePromptTaskQueuePromptTask : NovaCoreBase
- (instancetype)initWithName:(NSString *)name level:(NovaCorePromptTaskQueueTaskLevel *)level run:(void (^)(void))run __attribute__((swift_name("init(name:level:run:)"))) __attribute__((objc_designated_initializer));
- (void)reset __attribute__((swift_name("reset()")));
@property NovaCorePromptTaskQueueTaskLevel *level __attribute__((swift_name("level")));
@property NSString *name __attribute__((swift_name("name")));
@property void (^run)(void) __attribute__((swift_name("run")));
@property NovaCorePromptTaskQueueTaskStatus *status __attribute__((swift_name("status")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromptTaskQueue.TaskLevel")))
@interface NovaCorePromptTaskQueueTaskLevel : NovaCoreKotlinEnum<NovaCorePromptTaskQueueTaskLevel *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCorePromptTaskQueueTaskLevel *forced __attribute__((swift_name("forced")));
@property (class, readonly) NovaCorePromptTaskQueueTaskLevel *interaction __attribute__((swift_name("interaction")));
+ (NovaCoreKotlinArray<NovaCorePromptTaskQueueTaskLevel *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePromptTaskQueueTaskLevel *> *entries __attribute__((swift_name("entries")));
@property (readonly) int32_t weight __attribute__((swift_name("weight")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromptTaskQueue.TaskStatus")))
@interface NovaCorePromptTaskQueueTaskStatus : NovaCoreKotlinEnum<NovaCorePromptTaskQueueTaskStatus *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCorePromptTaskQueueTaskStatus *executing __attribute__((swift_name("executing")));
@property (class, readonly) NovaCorePromptTaskQueueTaskStatus *pending __attribute__((swift_name("pending")));
@property (class, readonly) NovaCorePromptTaskQueueTaskStatus *failed __attribute__((swift_name("failed")));
+ (NovaCoreKotlinArray<NovaCorePromptTaskQueueTaskStatus *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePromptTaskQueueTaskStatus *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SequentialTaskQueue")))
@interface NovaCoreSequentialTaskQueue : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (NovaCorePromiseInterface<id> *)addAsyncTaskTask:(NovaCorePromiseInterface<id> *(^)(void))task __attribute__((swift_name("addAsyncTask(task:)")));
- (NovaCorePromise<id> *)addTaskTask:(id _Nullable (^)(void))task __attribute__((swift_name("addTask(task:)")));
- (NovaCorePromiseInterface<NovaCoreKotlinUnit *> *)execute __attribute__((swift_name("execute()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SequentialTaskQueue.SyncTask")))
@interface NovaCoreSequentialTaskQueueSyncTask : NovaCoreBase
- (instancetype)initWithRun:(void (^)(void))run fail:(void (^)(NovaCoreKotlinThrowable *))fail __attribute__((swift_name("init(run:fail:)"))) __attribute__((objc_designated_initializer));
@property (readonly) void (^fail)(NovaCoreKotlinThrowable *) __attribute__((swift_name("fail")));
@property (readonly) void (^run)(void) __attribute__((swift_name("run")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TimerTask")))
@interface NovaCoreTimerTask : NovaCoreBase
- (instancetype)initWithType:(NovaCoreTimerTaskType *)type run:(void (^)(void))run __attribute__((swift_name("init(type:run:)"))) __attribute__((objc_designated_initializer));
- (void)run __attribute__((swift_name("run()")));
@property int32_t interval __attribute__((swift_name("interval")));
@property (readonly, getter=run_) void (^run)(void) __attribute__((swift_name("run")));
@property (readonly) NovaCoreTimerTaskType *type __attribute__((swift_name("type")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TimerTaskQueue")))
@interface NovaCoreTimerTaskQueue : NovaCoreBase
- (instancetype)initWithEngine:(id<NovaCoreTimerEngine>)engine __attribute__((swift_name("init(engine:)"))) __attribute__((objc_designated_initializer));
- (void)addCycleTaskInterval:(int32_t)interval task:(void (^)(void))task __attribute__((swift_name("addCycleTask(interval:task:)")));
- (void)addTaskTask:(NovaCoreTimerTask *)task __attribute__((swift_name("addTask(task:)")));
- (void)execute __attribute__((swift_name("execute()")));
@property id<NovaCoreTimerEngine> engine __attribute__((swift_name("engine")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TimerTaskType")))
@interface NovaCoreTimerTaskType : NovaCoreKotlinEnum<NovaCoreTimerTaskType *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCoreTimerTaskType *cycle __attribute__((swift_name("cycle")));
@property (class, readonly) NovaCoreTimerTaskType *once __attribute__((swift_name("once")));
+ (NovaCoreKotlinArray<NovaCoreTimerTaskType *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCoreTimerTaskType *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AccountUpdateListener")))
@interface NovaCoreAccountUpdateListener : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)accountUpdateListener __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreAccountUpdateListener *shared __attribute__((swift_name("shared")));
- (void)onConnectSuccessPlayer:(NovaCorePlayer *)player requestPlatform:(NovaCorePlatform *)requestPlatform credentials:(NovaCorePlatformCredentials * _Nullable)credentials __attribute__((swift_name("onConnectSuccess(player:requestPlatform:credentials:)")));
- (void)onLoginSuccessPlayer:(NovaCorePlayer *)player requestPlatform:(NovaCorePlatform *)requestPlatform credentials:(NovaCorePlatformCredentials * _Nullable)credentials __attribute__((swift_name("onLoginSuccess(player:requestPlatform:credentials:)")));
- (void)reloadData __attribute__((swift_name("reloadData()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AdEventTracking")))
@interface NovaCoreAdEventTracking : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)onAdClickedEventInfo:(NovaCoreAdEventInfo *)eventInfo otherInfo:(NSDictionary<NSString *, id> * _Nullable)otherInfo __attribute__((swift_name("onAdClicked(eventInfo:otherInfo:)")));
- (void)onAdDisplayFailedEventInfo:(NovaCoreAdEventInfo *)eventInfo errorCode:(int32_t)errorCode errorMessage:(NSString *)errorMessage otherInfo:(NSDictionary<NSString *, id> * _Nullable)otherInfo __attribute__((swift_name("onAdDisplayFailed(eventInfo:errorCode:errorMessage:otherInfo:)")));
- (void)onAdDisplayedEventInfo:(NovaCoreAdEventInfo *)eventInfo __attribute__((swift_name("onAdDisplayed(eventInfo:)")));
- (void)onAdLoadFailedEventInfo:(NovaCoreAdEventInfo *)eventInfo errorCode:(int32_t)errorCode errorMessage:(NSString *)errorMessage retryAttempt:(int32_t)retryAttempt otherInfo:(NSDictionary<NSString *, id> * _Nullable)otherInfo __attribute__((swift_name("onAdLoadFailed(eventInfo:errorCode:errorMessage:retryAttempt:otherInfo:)")));
- (void)onAdLoadedEventInfo:(NovaCoreAdEventInfo *)eventInfo retryAttempt:(int32_t)retryAttempt loadingTime:(double)loadingTime __attribute__((swift_name("onAdLoaded(eventInfo:retryAttempt:loadingTime:)")));
- (void)onAdRevenuePaidEventInfo:(NovaCoreAdEventInfo *)eventInfo revenue:(double)revenue currency:(NSString *)currency otherInfo:(NSDictionary<NSString *, id> * _Nullable)otherInfo firebaseParameters:(NSDictionary<NSString *, id> *)firebaseParameters __attribute__((swift_name("onAdRevenuePaid(eventInfo:revenue:currency:otherInfo:firebaseParameters:)")));
- (void)onAdRewardedEventInfo:(NovaCoreAdEventInfo *)eventInfo rewardAmount:(int32_t)rewardAmount rewardType:(NSString *)rewardType otherInfo:(NSDictionary<NSString *, id> * _Nullable)otherInfo __attribute__((swift_name("onAdRewarded(eventInfo:rewardAmount:rewardType:otherInfo:)")));
- (void)onAdViewClosedEventInfo:(NovaCoreAdEventInfo *)eventInfo otherInfo:(NSDictionary<NSString *, id> * _Nullable)otherInfo __attribute__((swift_name("onAdViewClosed(eventInfo:otherInfo:)")));
- (void)onGameRequestMediation:(NovaCoreAdMediation *)mediation adType:(NovaCoreAdType *)adType adUnitName:(NSString *)adUnitName placement:(NSString *)placement extensionParam:(NSString *)extensionParam __attribute__((swift_name("onGameRequest(mediation:adType:adUnitName:placement:extensionParam:)")));
- (void)onGameRequestResultEventInfo:(NovaCoreAdEventInfo *)eventInfo errorCode:(NSString *)errorCode errorMessage:(NSString *)errorMessage __attribute__((swift_name("onGameRequestResult(eventInfo:errorCode:errorMessage:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("EventParamCollection")))
@interface NovaCoreEventParamCollection : NovaCoreBase
- (instancetype)initWithTrackingKit:(NovaCoreTrackingKit *)trackingKit __attribute__((swift_name("init(trackingKit:)"))) __attribute__((objc_designated_initializer));
- (void)addKey:(NSString *)key value:(NSString *)value __attribute__((swift_name("add(key:value:)")));
- (NSString *)getKey:(NSString *)key __attribute__((swift_name("get(key:)")));
- (NSDictionary<NSString *, NSString *> *)getAll __attribute__((swift_name("getAll()")));
- (void)removeKey:(NSString *)key __attribute__((swift_name("remove(key:)")));
- (void)removeAll __attribute__((swift_name("removeAll()")));
- (void)setKey:(NSString *)key value:(NSString *)value __attribute__((swift_name("set(key:value:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OnlineListener")))
@interface NovaCoreOnlineListener : NovaCoreBase
- (instancetype)initWithTrackingKit:(NovaCoreTrackingKit *)trackingKit __attribute__((swift_name("init(trackingKit:)"))) __attribute__((objc_designated_initializer));
- (void)doRecordingByTimer __attribute__((swift_name("doRecordingByTimer()")));
- (void)onAppActive __attribute__((swift_name("onAppActive()")));
- (void)onAppInactive __attribute__((swift_name("onAppInactive()")));
- (void)onPlayerChanged __attribute__((swift_name("onPlayerChanged()")));
- (void)onRoleChanged __attribute__((swift_name("onRoleChanged()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RoleUpdateEventListener")))
@interface NovaCoreRoleUpdateEventListener : NovaCoreBase
- (instancetype)initWithTrackingKit:(NovaCoreTrackingKit *)trackingKit __attribute__((swift_name("init(trackingKit:)"))) __attribute__((objc_designated_initializer));
- (void)onCoinsChangedNewValue:(int32_t)newValue __attribute__((swift_name("onCoinsChanged(newValue:)")));
- (void)onLevelChangedNewValue:(int32_t)newValue __attribute__((swift_name("onLevelChanged(newValue:)")));
- (void)onVipLevelChangedNewValue:(int32_t)newValue __attribute__((swift_name("onVipLevelChanged(newValue:)")));
- (void)updateRoleNewValue:(NovaCoreGameRole * _Nullable)newValue __attribute__((swift_name("updateRole(newValue:)")));
@property (readonly) NovaCoreTrackingKit *trackingKit __attribute__((swift_name("trackingKit")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TiktokEventName")))
@interface NovaCoreTiktokEventName : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)tiktokEventName __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreTiktokEventName *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *ACHIEVE_LEVEL __attribute__((swift_name("ACHIEVE_LEVEL")));
@property (readonly) NSString *CHECKOUT __attribute__((swift_name("CHECKOUT")));
@property (readonly) NSString *COMPLETE_TUTORIAL __attribute__((swift_name("COMPLETE_TUTORIAL")));
@property (readonly) NSString *CREATE_ROLE __attribute__((swift_name("CREATE_ROLE")));
@property (readonly) NSString *LEVEL_UP __attribute__((swift_name("LEVEL_UP")));
@property (readonly) NSString *LOGIN __attribute__((swift_name("LOGIN")));
@property (readonly) NSString *PURCHASE __attribute__((swift_name("PURCHASE")));
@property (readonly) NSString *REGISTRATION __attribute__((swift_name("REGISTRATION")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TrackingEventName")))
@interface NovaCoreTrackingEventName : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)trackingEventName __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreTrackingEventName *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *ADMOB_REVENUE __attribute__((swift_name("ADMOB_REVENUE")));
@property (readonly) NSString *ADMOB_REVENUE_PAID __attribute__((swift_name("ADMOB_REVENUE_PAID")));
@property (readonly) NSString *AD_CLICKED __attribute__((swift_name("AD_CLICKED")));
@property (readonly) NSString *AD_DISPLAYED __attribute__((swift_name("AD_DISPLAYED")));
@property (readonly) NSString *AD_DISPLAYED_FAIL __attribute__((swift_name("AD_DISPLAYED_FAIL")));
@property (readonly) NSString *AD_HIDDEN __attribute__((swift_name("AD_HIDDEN")));
@property (readonly) NSString *AD_IMPRESSION_FIREBASE __attribute__((swift_name("AD_IMPRESSION_FIREBASE")));
@property (readonly) NSString *AD_IMPRESSION_REVENUE_FIREBASE __attribute__((swift_name("AD_IMPRESSION_REVENUE_FIREBASE")));
@property (readonly) NSString *AD_LOADED __attribute__((swift_name("AD_LOADED")));
@property (readonly) NSString *AD_LOAD_FAIL __attribute__((swift_name("AD_LOAD_FAIL")));
@property (readonly) NSString *AD_REVENUE_PAID __attribute__((swift_name("AD_REVENUE_PAID")));
@property (readonly) NSString *AD_SHOW_REQUEST __attribute__((swift_name("AD_SHOW_REQUEST")));
@property (readonly) NSString *AD_SHOW_REQUEST_RESULT __attribute__((swift_name("AD_SHOW_REQUEST_RESULT")));
@property (readonly) NSString *AD_TOTAL_REVENUE_FIREBASE __attribute__((swift_name("AD_TOTAL_REVENUE_FIREBASE")));
@property (readonly) NSString *AD_USER_REWARDED __attribute__((swift_name("AD_USER_REWARDED")));
@property (readonly) NSString *APPLOVIN_REVENUE_PAID __attribute__((swift_name("APPLOVIN_REVENUE_PAID")));
@property (readonly) NSString *CHECKOUT __attribute__((swift_name("CHECKOUT")));
@property (readonly) NSString *DELETE_ACCOUNT __attribute__((swift_name("DELETE_ACCOUNT")));
@property (readonly) NSString *DMA_AUTHORIZATION __attribute__((swift_name("DMA_AUTHORIZATION")));
@property (readonly) NSString *GAME_COMPLETE_TUTORIAL __attribute__((swift_name("GAME_COMPLETE_TUTORIAL")));
@property (readonly) NSString *GAME_CREATE_GROUP __attribute__((swift_name("GAME_CREATE_GROUP")));
@property (readonly) NSString *HTTP_ERROR __attribute__((swift_name("HTTP_ERROR")));
@property (readonly) NSString *IDFA_AUTHORIZATION __attribute__((swift_name("IDFA_AUTHORIZATION")));
@property (readonly) NSString *LOGIN_RETENTION __attribute__((swift_name("LOGIN_RETENTION")));
@property (readonly) NSString *MESSAGE_RESULT __attribute__((swift_name("MESSAGE_RESULT")));
@property (readonly) NSString *PAYMENT_RESULT __attribute__((swift_name("PAYMENT_RESULT")));
@property (readonly) NSString *SDK_ACHIEVE_LEVEL __attribute__((swift_name("SDK_ACHIEVE_LEVEL")));
@property (readonly) NSString *SDK_ACHIEVE_VIP_LEVEL __attribute__((swift_name("SDK_ACHIEVE_VIP_LEVEL")));
@property (readonly) NSString *SDK_AD_REVENUE __attribute__((swift_name("SDK_AD_REVENUE")));
@property (readonly) NSString *SDK_AGE_SIGNALS_RESULT __attribute__((swift_name("SDK_AGE_SIGNALS_RESULT")));
@property (readonly) NSString *SDK_CONNECT __attribute__((swift_name("SDK_CONNECT")));
@property (readonly) NSString *SDK_CREATE_ROLE __attribute__((swift_name("SDK_CREATE_ROLE")));
@property (readonly) NSString *SDK_DEVICE_ACTIVATION __attribute__((swift_name("SDK_DEVICE_ACTIVATION")));
@property (readonly) NSString *SDK_ENTER_BG __attribute__((swift_name("SDK_ENTER_BG")));
@property (readonly) NSString *SDK_INIT_DONE __attribute__((swift_name("SDK_INIT_DONE")));
@property (readonly) NSString *SDK_INIT_REMOTE_CONFIG_FETCHED __attribute__((swift_name("SDK_INIT_REMOTE_CONFIG_FETCHED")));
@property (readonly) NSString *SDK_INIT_SILENT_LOGGED_IN __attribute__((swift_name("SDK_INIT_SILENT_LOGGED_IN")));
@property (readonly) NSString *SDK_INIT_SKIP_SILENT_LOGGED_IN __attribute__((swift_name("SDK_INIT_SKIP_SILENT_LOGGED_IN")));
@property (readonly) NSString *SDK_INIT_STARTED __attribute__((swift_name("SDK_INIT_STARTED")));
@property (readonly) NSString *SDK_INIT_STEP __attribute__((swift_name("SDK_INIT_STEP")));
@property (readonly) NSString *SDK_LEVEL_UP __attribute__((swift_name("SDK_LEVEL_UP")));
@property (readonly) NSString *SDK_LOGIN __attribute__((swift_name("SDK_LOGIN")));
@property (readonly) NSString *SDK_LOGIN_CP __attribute__((swift_name("SDK_LOGIN_CP")));
@property (readonly) NSString *SDK_LOG_DEVICE __attribute__((swift_name("SDK_LOG_DEVICE")));
@property (readonly) NSString *SDK_NEW_USER __attribute__((swift_name("SDK_NEW_USER")));
@property (readonly) NSString *SDK_PLACE_ORDER __attribute__((swift_name("SDK_PLACE_ORDER")));
@property (readonly) NSString *SDK_PLAY_INTEGRITY_DIALOG_RESULT __attribute__((swift_name("SDK_PLAY_INTEGRITY_DIALOG_RESULT")));
@property (readonly) NSString *SDK_PLAY_INTEGRITY_RESULT __attribute__((swift_name("SDK_PLAY_INTEGRITY_RESULT")));
@property (readonly) NSString *SDK_PURCHASE_PRODUCT __attribute__((swift_name("SDK_PURCHASE_PRODUCT")));
@property (readonly) NSString *SDK_REVENUE __attribute__((swift_name("SDK_REVENUE")));
@property (readonly) NSString *SDK_ROLE_USE_START __attribute__((swift_name("SDK_ROLE_USE_START")));
@property (readonly) NSString *SDK_ROLE_USE_TIME __attribute__((swift_name("SDK_ROLE_USE_TIME")));
@property (readonly) NSString *SDK_SCENE __attribute__((swift_name("SDK_SCENE")));
@property (readonly) NSString *SDK_SHARE __attribute__((swift_name("SDK_SHARE")));
@property (readonly) NSString *SDK_UPDATE_ROLE __attribute__((swift_name("SDK_UPDATE_ROLE")));
@property (readonly) NSString *SDK_USE_EXTERNAL_BILL __attribute__((swift_name("SDK_USE_EXTERNAL_BILL")));
@property (readonly) NSString *SDK_VIP_LEVEL_UP __attribute__((swift_name("SDK_VIP_LEVEL_UP")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TrackingEventParameter")))
@interface NovaCoreTrackingEventParameter : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)trackingEventParameter __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreTrackingEventParameter *shared __attribute__((swift_name("shared")));
@property (readonly) NSString *AD_ERROR_CODE __attribute__((swift_name("AD_ERROR_CODE")));
@property (readonly) NSString *AD_ERROR_MESSAGE __attribute__((swift_name("AD_ERROR_MESSAGE")));
@property (readonly) NSString *AD_ERROR_NAME __attribute__((swift_name("AD_ERROR_NAME")));
@property (readonly) NSString *AD_FORMAT __attribute__((swift_name("AD_FORMAT")));
@property (readonly) NSString *AD_GAME_EXT __attribute__((swift_name("AD_GAME_EXT")));
@property (readonly) NSString *AD_GAME_PLACEMENT __attribute__((swift_name("AD_GAME_PLACEMENT")));
@property (readonly) NSString *AD_MEDIATION __attribute__((swift_name("AD_MEDIATION")));
@property (readonly) NSString *AD_NETWORK_NAME __attribute__((swift_name("AD_NETWORK_NAME")));
@property (readonly) NSString *AD_NETWORK_PLACEMENT __attribute__((swift_name("AD_NETWORK_PLACEMENT")));
@property (readonly) NSString *AD_PRECISION_TYPE __attribute__((swift_name("AD_PRECISION_TYPE")));
@property (readonly) NSString *AD_REVENUE __attribute__((swift_name("AD_REVENUE")));
@property (readonly) NSString *AD_REVENUE_CURRENCY __attribute__((swift_name("AD_REVENUE_CURRENCY")));
@property (readonly) NSString *AD_REWARD_AMOUNT __attribute__((swift_name("AD_REWARD_AMOUNT")));
@property (readonly) NSString *AD_REWARD_TYPE __attribute__((swift_name("AD_REWARD_TYPE")));
@property (readonly) NSString *AD_STAY_TIME __attribute__((swift_name("AD_STAY_TIME")));
@property (readonly) NSString *AD_TOTAL_REQUEST __attribute__((swift_name("AD_TOTAL_REQUEST")));
@property (readonly) NSString *AD_TOTAL_REWARDED __attribute__((swift_name("AD_TOTAL_REWARDED")));
@property (readonly) NSString *AD_TYPE __attribute__((swift_name("AD_TYPE")));
@property (readonly) NSString *AD_UNIT_ID __attribute__((swift_name("AD_UNIT_ID")));
@property (readonly) NSString *AD_UNIT_NAME __attribute__((swift_name("AD_UNIT_NAME")));
@property (readonly) NSString *LEVEL __attribute__((swift_name("LEVEL")));
@property (readonly) NSString *PLAYER_ID __attribute__((swift_name("PLAYER_ID")));
@property (readonly) NSString *ROLE_ID __attribute__((swift_name("ROLE_ID")));
@property (readonly) NSString *ROLE_NAME __attribute__((swift_name("ROLE_NAME")));
@property (readonly) NSString *SERVER_ID __attribute__((swift_name("SERVER_ID")));
@property (readonly) NSString *SERVER_NAME __attribute__((swift_name("SERVER_NAME")));
@property (readonly) NSString *VIP_LEVEL __attribute__((swift_name("VIP_LEVEL")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TrackingKit")))
@interface NovaCoreTrackingKit : NovaCoreBase
- (instancetype)initWithEngine:(id<NovaCoreEngineInterface>)engine __attribute__((swift_name("init(engine:)"))) __attribute__((objc_designated_initializer));
- (void)adjustLogAdRevenueMediationName:(NSString *)mediationName price:(double)price currency:(NSString *)currency networkName:(NSString *)networkName networkPlacement:(NSString *)networkPlacement unitId:(NSString *)unitId customerDataStr:(NSString *)customerDataStr __attribute__((swift_name("adjustLogAdRevenue(mediationName:price:currency:networkName:networkPlacement:unitId:customerDataStr:)")));
- (void)logCoinsChangeCoins:(int32_t)coins __attribute__((swift_name("logCoinsChange(coins:)")));
- (void)logEventName:(NSString *)name params:(NSDictionary<NSString *, id> * _Nullable)params __attribute__((swift_name("logEvent(name:params:)")));
- (void)logEventName:(NSString *)name params:(NSDictionary<NSString *, id> * _Nullable)params consumer:(int32_t)consumer __attribute__((swift_name("logEvent(name:params:consumer:)")));
- (void)logLevelUpNewLevel:(int32_t)newLevel __attribute__((swift_name("logLevelUp(newLevel:)")));
- (void)logOnlineEventName:(NSString *)eventName params:(NSDictionary<NSString *, id> * _Nullable)params userInfo:(NSDictionary<NSString *, id> * _Nullable)userInfo __attribute__((swift_name("logOnline(eventName:params:userInfo:)")));
- (void)logRevenuePrice:(double)price currency:(NSString *)currency purchaseId:(NSString *)purchaseId productId:(NSString *)productId __attribute__((swift_name("logRevenue(price:currency:purchaseId:productId:)")));
- (void)logVipLevelUpNewLevel:(int32_t)newLevel __attribute__((swift_name("logVipLevelUp(newLevel:)")));
@property (readonly) NovaCoreAdEventTracking *adEventTracking __attribute__((swift_name("adEventTracking")));
@property (readonly) NovaCoreEventParamCollection *commonParameters __attribute__((swift_name("commonParameters")));
@property int32_t defaultConsumer __attribute__((swift_name("defaultConsumer")));
@property (readonly) id<NovaCoreEngineInterface> engine __attribute__((swift_name("engine")));
@property (readonly) NovaCoreOnlineListener *onlineListener __attribute__((swift_name("onlineListener")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TrackingKit.TrackingConsumer")))
@interface NovaCoreTrackingKitTrackingConsumer : NovaCoreBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (class, readonly, getter=companion) NovaCoreTrackingKitTrackingConsumerCompanion *companion __attribute__((swift_name("companion")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TrackingKit.TrackingConsumerCompanion")))
@interface NovaCoreTrackingKitTrackingConsumerCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreTrackingKitTrackingConsumerCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) int32_t ADJUST __attribute__((swift_name("ADJUST")));
@property (readonly) int32_t ALL __attribute__((swift_name("ALL")));
@property (readonly) int32_t DEFAULT __attribute__((swift_name("DEFAULT")));
@property (readonly) int32_t FACEBOOK __attribute__((swift_name("FACEBOOK")));
@property (readonly) int32_t FIREBASE __attribute__((swift_name("FIREBASE")));
@property (readonly) int32_t TD __attribute__((swift_name("TD")));
@property (readonly) int32_t TIKTOK __attribute__((swift_name("TIKTOK")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DataValidUtil")))
@interface NovaCoreDataValidUtil : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)dataValidUtil __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreDataValidUtil *shared __attribute__((swift_name("shared")));
- (BOOL)checkEmailValidEmail:(NSString *)email __attribute__((swift_name("checkEmailValid(email:)")));
- (BOOL)checkNumberValidNumber:(NSString *)number __attribute__((swift_name("checkNumberValid(number:)")));
@end

__attribute__((swift_name("DnsClientEngine")))
@protocol NovaCoreDnsClientEngine
@required
- (NovaCorePromiseInterface<NSString *> *)queryDomain:(NSString *)domain __attribute__((swift_name("query(domain:)")));
- (NovaCorePromiseInterface<NSString *> *)resolveHost:(NSString *)host __attribute__((swift_name("resolve(host:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlaceHolderUtil")))
@interface NovaCorePlaceHolderUtil : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)placeHolderUtil __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePlaceHolderUtil *shared __attribute__((swift_name("shared")));
- (NSString *)replacePlaceholdersUrl:(NSString *)url extensionParam:(NSString *)extensionParam productId:(NSString *)productId productType:(NSString *)productType customPlaceholders:(NSDictionary<NSString *, NSString *> *)customPlaceholders __attribute__((swift_name("replacePlaceholders(url:extensionParam:productId:productType:customPlaceholders:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlatformUtil")))
@interface NovaCorePlatformUtil : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)platformUtil __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePlatformUtil *shared __attribute__((swift_name("shared")));
- (BOOL)supportConnectPlatform:(NovaCorePlatform *)platform __attribute__((swift_name("supportConnect(platform:)")));
- (BOOL)supportLoginPlatform:(NovaCorePlatform *)platform __attribute__((swift_name("supportLogin(platform:)")));
@property (readonly) NovaCoreKotlinArray<NovaCoreRevealedPlatform *> *allPlatforms __attribute__((swift_name("allPlatforms")));
@property (readonly) NovaCoreKotlinArray<NovaCoreRevealedPlatform *> *loginPlatforms __attribute__((swift_name("loginPlatforms")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromiseCompanion")))
@interface NovaCorePromiseCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCorePromiseCompanion *shared __attribute__((swift_name("shared")));
- (NovaCorePromise<id> *)rejectedPromiseReason:(NovaCoreKotlinThrowable *)reason __attribute__((swift_name("rejectedPromise(reason:)")));
- (NovaCorePromise<id> *)resolvedPromiseResult:(id _Nullable)result __attribute__((swift_name("resolvedPromise(result:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromiseHandler")))
@interface NovaCorePromiseHandler<ResultType> : NovaCoreBase
- (instancetype)initWithOnSuccess:(void (^)(ResultType _Nullable))onSuccess onFailure:(void (^)(NovaCoreKotlinThrowable *))onFailure __attribute__((swift_name("init(onSuccess:onFailure:)"))) __attribute__((objc_designated_initializer));
- (NovaCorePromiseHandler<ResultType> *)doCopyOnSuccess:(void (^)(ResultType _Nullable))onSuccess onFailure:(void (^)(NovaCoreKotlinThrowable *))onFailure __attribute__((swift_name("doCopy(onSuccess:onFailure:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) void (^onFailure)(NovaCoreKotlinThrowable *) __attribute__((swift_name("onFailure")));
@property (readonly) void (^onSuccess)(ResultType _Nullable) __attribute__((swift_name("onSuccess")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromiseRejectionException")))
@interface NovaCorePromiseRejectionException : NovaCoreKotlinThrowable
- (instancetype)initWithReason:(id _Nullable)reason __attribute__((swift_name("init(reason:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(NovaCoreKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) id _Nullable reason __attribute__((swift_name("reason")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PromiseState")))
@interface NovaCorePromiseState : NovaCoreKotlinEnum<NovaCorePromiseState *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly) NovaCorePromiseState *pending __attribute__((swift_name("pending")));
@property (class, readonly) NovaCorePromiseState *fulfilled __attribute__((swift_name("fulfilled")));
@property (class, readonly) NovaCorePromiseState *rejected __attribute__((swift_name("rejected")));
+ (NovaCoreKotlinArray<NovaCorePromiseState *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<NovaCorePromiseState *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("SocialPlatformUtils")))
@interface NovaCoreSocialPlatformUtils : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)socialPlatformUtils __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreSocialPlatformUtils *shared __attribute__((swift_name("shared")));
- (NSDictionary<NovaCoreSocialPlatform *, NSString *> *)getAvailableSocialPlatform __attribute__((swift_name("getAvailableSocialPlatform()")));
- (NSArray<NovaCoreShareElement *> *)shareElements __attribute__((swift_name("shareElements()")));
@end

__attribute__((swift_name("TimerEngine")))
@protocol NovaCoreTimerEngine
@required
- (void)cancel __attribute__((swift_name("cancel()")));
- (void)eventTask:(void (^)(void))task __attribute__((swift_name("event(task:)")));
- (void)resume __attribute__((swift_name("resume()")));
- (void)suspend __attribute__((swift_name("suspend()")));
@end

__attribute__((swift_name("ToolFunctionInterface")))
@protocol NovaCoreToolFunctionInterface
@required
- (NSString *)decodeBase64Str:(NSString *)str __attribute__((swift_name("decodeBase64(str:)")));
- (NSString *)encodeBase64Str:(NSString *)str __attribute__((swift_name("encodeBase64(str:)")));
- (NSString *)md5Str:(NSString *)str __attribute__((swift_name("md5(str:)")));
- (NovaCoreWaitable *)netPingCount:(int32_t)count target:(NSString *)target callback:(void (^)(NSArray<NSString *> *))callback __attribute__((swift_name("netPing(count:target:callback:)")));
- (NovaCoreWaitable *)netTracerouteTarget:(NSString *)target port:(NSString *)port maxHop:(int32_t)maxHop callback:(void (^)(NSArray<NSString *> *))callback __attribute__((swift_name("netTraceroute(target:port:maxHop:callback:)")));
- (NovaCoreKotlinByteArray *)rc4Key:(NSString *)key str:(NSString *)str __attribute__((swift_name("rc4(key:str:)")));
@end

@interface NovaCoreKotlinThrowable (Extensions)
- (NSString *)getCallerPrefix __attribute__((swift_name("getCallerPrefix()")));
- (int32_t)getExtraStackDepth __attribute__((swift_name("getExtraStackDepth()")));
- (NovaCoreKotlinArray<NovaCoreTraceElement *> *)getStackTraceElements __attribute__((swift_name("getStackTraceElements()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable(with=NormalClass(value=kotlinx/serialization/json/JsonElementSerializer))
*/
__attribute__((swift_name("Kotlinx_serialization_jsonJsonElement")))
@interface NovaCoreKotlinx_serialization_jsonJsonElement : NovaCoreBase
@property (class, readonly, getter=companion) NovaCoreKotlinx_serialization_jsonJsonElementCompanion *companion __attribute__((swift_name("companion")));
@end

@interface NovaCoreKotlinx_serialization_jsonJsonElement (Extensions)
- (id _Nullable)getKey_:(NSString *)key __attribute__((swift_name("get(key_:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ConfigKt")))
@interface NovaCoreConfigKt : NovaCoreBase
@property (class, readonly) int32_t PLAYER_TOKEN_WILL_EXP __attribute__((swift_name("PLAYER_TOKEN_WILL_EXP")));
@property (class, readonly) int32_t REFRESH_TOKEN_WILL_EXP __attribute__((swift_name("REFRESH_TOKEN_WILL_EXP")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("JsonKt")))
@interface NovaCoreJsonKt : NovaCoreBase
+ (NovaCoreKotlinx_serialization_jsonJsonElement *)toJsonElement:(NSDictionary<NSString *, id> *)receiver __attribute__((swift_name("toJsonElement(_:)")));
@property (class, readonly) NovaCoreKotlinx_serialization_jsonJsonElement *EmptyJsonElement __attribute__((swift_name("EmptyJsonElement")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Logging_iosKt")))
@interface NovaCoreLogging_iosKt : NovaCoreBase
+ (NSString *)getCurrentThreadId __attribute__((swift_name("getCurrentThreadId()")));
+ (NSString *)getCurrentThreadName __attribute__((swift_name("getCurrentThreadName()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LoggingKt")))
@interface NovaCoreLoggingKt : NovaCoreBase
+ (void)mdebugMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("mdebug(message:args:)")));
+ (void)merrorMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("merror(message:args:)")));
+ (void)mfatalMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("mfatal(message:args:)")));
+ (void)minfoMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("minfo(message:args:)")));
+ (void)mnoticeMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("mnotice(message:args:)")));
+ (NSString *)mtraceLevel:(NovaCoreLogLevel *)level message:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("mtrace(level:message:args:)")));
+ (void)mwarningMessage:(NSString *)message args:(NovaCoreKotlinArray<id> *)args __attribute__((swift_name("mwarning(message:args:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Platform_iosKt")))
@interface NovaCorePlatform_iosKt : NovaCoreBase

/**
 * @note annotations
 *   kotlin.ExperimentalUnsignedTypes
*/
+ (void)delayExecuteTime:(int64_t)time invoke:(void (^)(void))invoke __attribute__((swift_name("delayExecute(time:invoke:)")));
+ (NSString *)deviceCountryCode __attribute__((swift_name("deviceCountryCode()")));
+ (id _Nullable)enforceSdkThreadRunBlock:(id _Nullable (^)(void))block __attribute__((swift_name("enforceSdkThreadRun(block:)")));
+ (int64_t)getMillisTimestamp __attribute__((swift_name("getMillisTimestamp()")));
+ (NovaCoreRunningPlatform *)getPlatform __attribute__((swift_name("getPlatform()")));
+ (int32_t)getTimestamp __attribute__((swift_name("getTimestamp()")));
+ (double)plusValue1:(double)value1 value2:(double)value2 __attribute__((swift_name("plus(value1:value2:)")));
+ (void)sleepThreadMilliseconds:(int64_t)milliseconds __attribute__((swift_name("sleepThread(milliseconds:)")));
+ (NSString *)urlDecodeUrl:(NSString *)url __attribute__((swift_name("urlDecode(url:)")));
+ (NSString *)urlEncodeUrl:(NSString *)url __attribute__((swift_name("urlEncode(url:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ProductInfoKt")))
@interface NovaCoreProductInfoKt : NovaCoreBase
@property (class, readonly) NSString *SUBS_PRODUCT_ID_PREFIX1 __attribute__((swift_name("SUBS_PRODUCT_ID_PREFIX1")));
@property (class, readonly) NSString *SUBS_PRODUCT_ID_PREFIX2 __attribute__((swift_name("SUBS_PRODUCT_ID_PREFIX2")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RestfulHttpRequestKt")))
@interface NovaCoreRestfulHttpRequestKt : NovaCoreBase
+ (NovaCoreRestfulHttpRequest *)RestfulHttpRequestInit:(void (^)(NovaCoreRestfulHttpRequest *))init __attribute__((swift_name("RestfulHttpRequest(init:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinUnit")))
@interface NovaCoreKotlinUnit : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)unit __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreKotlinUnit *shared __attribute__((swift_name("shared")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinArray")))
@interface NovaCoreKotlinArray<T> : NovaCoreBase
+ (instancetype)arrayWithSize:(int32_t)size init:(T _Nullable (^)(NovaCoreInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (T _Nullable)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (id<NovaCoreKotlinIterator>)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(T _Nullable)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinEnumCompanion")))
@interface NovaCoreKotlinEnumCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreKotlinEnumCompanion *shared __attribute__((swift_name("shared")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerializersModule")))
@interface NovaCoreKotlinx_serialization_coreSerializersModule : NovaCoreBase

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)dumpToCollector:(id<NovaCoreKotlinx_serialization_coreSerializersModuleCollector>)collector __attribute__((swift_name("dumpTo(collector:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<NovaCoreKotlinx_serialization_coreKSerializer> _Nullable)getContextualKClass:(id<NovaCoreKotlinKClass>)kClass typeArgumentsSerializers:(NSArray<id<NovaCoreKotlinx_serialization_coreKSerializer>> *)typeArgumentsSerializers __attribute__((swift_name("getContextual(kClass:typeArgumentsSerializers:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<NovaCoreKotlinx_serialization_coreSerializationStrategy> _Nullable)getPolymorphicBaseClass:(id<NovaCoreKotlinKClass>)baseClass value:(id)value __attribute__((swift_name("getPolymorphic(baseClass:value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<NovaCoreKotlinx_serialization_coreDeserializationStrategy> _Nullable)getPolymorphicBaseClass:(id<NovaCoreKotlinKClass>)baseClass serializedClassName:(NSString * _Nullable)serializedClassName __attribute__((swift_name("getPolymorphic(baseClass:serializedClassName:)")));
@end

__attribute__((swift_name("KotlinKDeclarationContainer")))
@protocol NovaCoreKotlinKDeclarationContainer
@required
@end

__attribute__((swift_name("KotlinKAnnotatedElement")))
@protocol NovaCoreKotlinKAnnotatedElement
@required
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
__attribute__((swift_name("KotlinKClassifier")))
@protocol NovaCoreKotlinKClassifier
@required
@end

__attribute__((swift_name("KotlinKClass")))
@protocol NovaCoreKotlinKClass <NovaCoreKotlinKDeclarationContainer, NovaCoreKotlinKAnnotatedElement, NovaCoreKotlinKClassifier>
@required

/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
- (BOOL)isInstanceValue:(id _Nullable)value __attribute__((swift_name("isInstance(value:)")));
@property (readonly) NSString * _Nullable qualifiedName __attribute__((swift_name("qualifiedName")));
@property (readonly) NSString * _Nullable simpleName __attribute__((swift_name("simpleName")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreEncoder")))
@protocol NovaCoreKotlinx_serialization_coreEncoder
@required
- (id<NovaCoreKotlinx_serialization_coreCompositeEncoder>)beginCollectionDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor collectionSize:(int32_t)collectionSize __attribute__((swift_name("beginCollection(descriptor:collectionSize:)")));
- (id<NovaCoreKotlinx_serialization_coreCompositeEncoder>)beginStructureDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("beginStructure(descriptor:)")));
- (void)encodeBooleanValue:(BOOL)value __attribute__((swift_name("encodeBoolean(value:)")));
- (void)encodeByteValue:(int8_t)value __attribute__((swift_name("encodeByte(value:)")));
- (void)encodeCharValue:(unichar)value __attribute__((swift_name("encodeChar(value:)")));
- (void)encodeDoubleValue:(double)value __attribute__((swift_name("encodeDouble(value:)")));
- (void)encodeEnumEnumDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)enumDescriptor index:(int32_t)index __attribute__((swift_name("encodeEnum(enumDescriptor:index:)")));
- (void)encodeFloatValue:(float)value __attribute__((swift_name("encodeFloat(value:)")));
- (id<NovaCoreKotlinx_serialization_coreEncoder>)encodeInlineDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("encodeInline(descriptor:)")));
- (void)encodeIntValue:(int32_t)value __attribute__((swift_name("encodeInt(value:)")));
- (void)encodeLongValue:(int64_t)value __attribute__((swift_name("encodeLong(value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNotNullMark __attribute__((swift_name("encodeNotNullMark()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNull __attribute__((swift_name("encodeNull()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNullableSerializableValueSerializer:(id<NovaCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeNullableSerializableValue(serializer:value:)")));
- (void)encodeSerializableValueSerializer:(id<NovaCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeSerializableValue(serializer:value:)")));
- (void)encodeShortValue:(int16_t)value __attribute__((swift_name("encodeShort(value:)")));
- (void)encodeStringValue:(NSString *)value __attribute__((swift_name("encodeString(value:)")));
@property (readonly) NovaCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerialDescriptor")))
@protocol NovaCoreKotlinx_serialization_coreSerialDescriptor
@required

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NSArray<id<NovaCoreKotlinAnnotation>> *)getElementAnnotationsIndex:(int32_t)index __attribute__((swift_name("getElementAnnotations(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)getElementDescriptorIndex:(int32_t)index __attribute__((swift_name("getElementDescriptor(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (int32_t)getElementIndexName:(NSString *)name __attribute__((swift_name("getElementIndex(name:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NSString *)getElementNameIndex:(int32_t)index __attribute__((swift_name("getElementName(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)isElementOptionalIndex:(int32_t)index __attribute__((swift_name("isElementOptional(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSArray<id<NovaCoreKotlinAnnotation>> *annotations __attribute__((swift_name("annotations")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) int32_t elementsCount __attribute__((swift_name("elementsCount")));
@property (readonly) BOOL isInline __attribute__((swift_name("isInline")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) BOOL isNullable __attribute__((swift_name("isNullable")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NovaCoreKotlinx_serialization_coreSerialKind *kind __attribute__((swift_name("kind")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSString *serialName __attribute__((swift_name("serialName")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreDecoder")))
@protocol NovaCoreKotlinx_serialization_coreDecoder
@required
- (id<NovaCoreKotlinx_serialization_coreCompositeDecoder>)beginStructureDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("beginStructure(descriptor:)")));
- (BOOL)decodeBoolean __attribute__((swift_name("decodeBoolean()")));
- (int8_t)decodeByte __attribute__((swift_name("decodeByte()")));
- (unichar)decodeChar __attribute__((swift_name("decodeChar()")));
- (double)decodeDouble __attribute__((swift_name("decodeDouble()")));
- (int32_t)decodeEnumEnumDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)enumDescriptor __attribute__((swift_name("decodeEnum(enumDescriptor:)")));
- (float)decodeFloat __attribute__((swift_name("decodeFloat()")));
- (id<NovaCoreKotlinx_serialization_coreDecoder>)decodeInlineDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeInline(descriptor:)")));
- (int32_t)decodeInt __attribute__((swift_name("decodeInt()")));
- (int64_t)decodeLong __attribute__((swift_name("decodeLong()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)decodeNotNullMark __attribute__((swift_name("decodeNotNullMark()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NovaCoreKotlinNothing * _Nullable)decodeNull __attribute__((swift_name("decodeNull()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id _Nullable)decodeNullableSerializableValueDeserializer:(id<NovaCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer __attribute__((swift_name("decodeNullableSerializableValue(deserializer:)")));
- (id _Nullable)decodeSerializableValueDeserializer:(id<NovaCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer __attribute__((swift_name("decodeSerializableValue(deserializer:)")));
- (int16_t)decodeShort __attribute__((swift_name("decodeShort()")));
- (NSString *)decodeString __attribute__((swift_name("decodeString()")));
@property (readonly) NovaCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinByteArray")))
@interface NovaCoreKotlinByteArray : NovaCoreBase
+ (instancetype)arrayWithSize:(int32_t)size __attribute__((swift_name("init(size:)")));
+ (instancetype)arrayWithSize:(int32_t)size init:(NovaCoreByte *(^)(NovaCoreInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (int8_t)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (NovaCoreKotlinByteIterator *)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(int8_t)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Kotlinx_serialization_jsonJsonElement.Companion")))
@interface NovaCoreKotlinx_serialization_jsonJsonElementCompanion : NovaCoreBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) NovaCoreKotlinx_serialization_jsonJsonElementCompanion *shared __attribute__((swift_name("shared")));
- (id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((swift_name("KotlinIterator")))
@protocol NovaCoreKotlinIterator
@required
- (BOOL)hasNext __attribute__((swift_name("hasNext()")));
- (id _Nullable)next __attribute__((swift_name("next()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_coreSerializersModuleCollector")))
@protocol NovaCoreKotlinx_serialization_coreSerializersModuleCollector
@required
- (void)contextualKClass:(id<NovaCoreKotlinKClass>)kClass provider:(id<NovaCoreKotlinx_serialization_coreKSerializer> (^)(NSArray<id<NovaCoreKotlinx_serialization_coreKSerializer>> *))provider __attribute__((swift_name("contextual(kClass:provider:)")));
- (void)contextualKClass:(id<NovaCoreKotlinKClass>)kClass serializer:(id<NovaCoreKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("contextual(kClass:serializer:)")));
- (void)polymorphicBaseClass:(id<NovaCoreKotlinKClass>)baseClass actualClass:(id<NovaCoreKotlinKClass>)actualClass actualSerializer:(id<NovaCoreKotlinx_serialization_coreKSerializer>)actualSerializer __attribute__((swift_name("polymorphic(baseClass:actualClass:actualSerializer:)")));
- (void)polymorphicDefaultBaseClass:(id<NovaCoreKotlinKClass>)baseClass defaultDeserializerProvider:(id<NovaCoreKotlinx_serialization_coreDeserializationStrategy> _Nullable (^)(NSString * _Nullable))defaultDeserializerProvider __attribute__((swift_name("polymorphicDefault(baseClass:defaultDeserializerProvider:)"))) __attribute__((deprecated("Deprecated in favor of function with more precise name: polymorphicDefaultDeserializer")));
- (void)polymorphicDefaultDeserializerBaseClass:(id<NovaCoreKotlinKClass>)baseClass defaultDeserializerProvider:(id<NovaCoreKotlinx_serialization_coreDeserializationStrategy> _Nullable (^)(NSString * _Nullable))defaultDeserializerProvider __attribute__((swift_name("polymorphicDefaultDeserializer(baseClass:defaultDeserializerProvider:)")));
- (void)polymorphicDefaultSerializerBaseClass:(id<NovaCoreKotlinKClass>)baseClass defaultSerializerProvider:(id<NovaCoreKotlinx_serialization_coreSerializationStrategy> _Nullable (^)(id))defaultSerializerProvider __attribute__((swift_name("polymorphicDefaultSerializer(baseClass:defaultSerializerProvider:)")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreCompositeEncoder")))
@protocol NovaCoreKotlinx_serialization_coreCompositeEncoder
@required
- (void)encodeBooleanElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(BOOL)value __attribute__((swift_name("encodeBooleanElement(descriptor:index:value:)")));
- (void)encodeByteElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int8_t)value __attribute__((swift_name("encodeByteElement(descriptor:index:value:)")));
- (void)encodeCharElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(unichar)value __attribute__((swift_name("encodeCharElement(descriptor:index:value:)")));
- (void)encodeDoubleElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(double)value __attribute__((swift_name("encodeDoubleElement(descriptor:index:value:)")));
- (void)encodeFloatElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(float)value __attribute__((swift_name("encodeFloatElement(descriptor:index:value:)")));
- (id<NovaCoreKotlinx_serialization_coreEncoder>)encodeInlineElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("encodeInlineElement(descriptor:index:)")));
- (void)encodeIntElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int32_t)value __attribute__((swift_name("encodeIntElement(descriptor:index:value:)")));
- (void)encodeLongElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int64_t)value __attribute__((swift_name("encodeLongElement(descriptor:index:value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNullableSerializableElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index serializer:(id<NovaCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeNullableSerializableElement(descriptor:index:serializer:value:)")));
- (void)encodeSerializableElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index serializer:(id<NovaCoreKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeSerializableElement(descriptor:index:serializer:value:)")));
- (void)encodeShortElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int16_t)value __attribute__((swift_name("encodeShortElement(descriptor:index:value:)")));
- (void)encodeStringElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(NSString *)value __attribute__((swift_name("encodeStringElement(descriptor:index:value:)")));
- (void)endStructureDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("endStructure(descriptor:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)shouldEncodeElementDefaultDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("shouldEncodeElementDefault(descriptor:index:)")));
@property (readonly) NovaCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("KotlinAnnotation")))
@protocol NovaCoreKotlinAnnotation
@required
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_coreSerialKind")))
@interface NovaCoreKotlinx_serialization_coreSerialKind : NovaCoreBase
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreCompositeDecoder")))
@protocol NovaCoreKotlinx_serialization_coreCompositeDecoder
@required
- (BOOL)decodeBooleanElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeBooleanElement(descriptor:index:)")));
- (int8_t)decodeByteElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeByteElement(descriptor:index:)")));
- (unichar)decodeCharElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeCharElement(descriptor:index:)")));
- (int32_t)decodeCollectionSizeDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeCollectionSize(descriptor:)")));
- (double)decodeDoubleElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeDoubleElement(descriptor:index:)")));
- (int32_t)decodeElementIndexDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeElementIndex(descriptor:)")));
- (float)decodeFloatElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeFloatElement(descriptor:index:)")));
- (id<NovaCoreKotlinx_serialization_coreDecoder>)decodeInlineElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeInlineElement(descriptor:index:)")));
- (int32_t)decodeIntElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeIntElement(descriptor:index:)")));
- (int64_t)decodeLongElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeLongElement(descriptor:index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id _Nullable)decodeNullableSerializableElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index deserializer:(id<NovaCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer previousValue:(id _Nullable)previousValue __attribute__((swift_name("decodeNullableSerializableElement(descriptor:index:deserializer:previousValue:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)decodeSequentially __attribute__((swift_name("decodeSequentially()")));
- (id _Nullable)decodeSerializableElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index deserializer:(id<NovaCoreKotlinx_serialization_coreDeserializationStrategy>)deserializer previousValue:(id _Nullable)previousValue __attribute__((swift_name("decodeSerializableElement(descriptor:index:deserializer:previousValue:)")));
- (int16_t)decodeShortElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeShortElement(descriptor:index:)")));
- (NSString *)decodeStringElementDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeStringElement(descriptor:index:)")));
- (void)endStructureDescriptor:(id<NovaCoreKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("endStructure(descriptor:)")));
@property (readonly) NovaCoreKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinNothing")))
@interface NovaCoreKotlinNothing : NovaCoreBase
@end

__attribute__((swift_name("KotlinByteIterator")))
@interface NovaCoreKotlinByteIterator : NovaCoreBase <NovaCoreKotlinIterator>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (NovaCoreByte *)next __attribute__((swift_name("next()")));
- (int8_t)nextByte __attribute__((swift_name("nextByte()")));
@end

#pragma pop_macro("_Nullable_result")
#pragma clang diagnostic pop
NS_ASSUME_NONNULL_END
