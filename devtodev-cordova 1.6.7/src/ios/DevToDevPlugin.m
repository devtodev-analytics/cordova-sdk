#import "DevToDevPlugin.h"
#import "DevToDev.h"
#import "DevToDevPushManager.h"

@interface DevToDevPlugin () <DevToDevPushManagerDelegate>

@end

@implementation DevToDevPlugin

@synthesize callbackIds = _callbackIds;

- (id)init {
    self = [super init];
    
    if (self) {

    }
    
    return self;
}

- (NSMutableDictionary *)callbackIds {
    if (_callbackIds == nil) {
        _callbackIds = [[NSMutableDictionary alloc] init];
    }
    return _callbackIds;
}

- (void) init:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString* appKey = [command.arguments objectAtIndex:0];
            NSString* appSecret = [command.arguments objectAtIndex:1];

            [DevToDev initWithKey:appKey andSecretKey:appSecret];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setActiveLog:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            BOOL isActiveLog = [[command.arguments objectAtIndex:0] isEqualToString:@"YES"] ? YES : NO;
            [DevToDev setActiveLog:isActiveLog];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) sendBufferedEvents:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            [DevToDev sendBufferedEvents];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) tutorialCompleted:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSInteger step = [[command.arguments objectAtIndex:0] integerValue];
            [DevToDev tutorialCompleted:step];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) levelUp:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSInteger level = [[command.arguments objectAtIndex:0] integerValue];
            NSDictionary * resources = [command.arguments objectAtIndex:1];
            if (resources != nil && resources != (id)[NSNull null] && resources.count > 0) {
                [DevToDev levelUp:level withResources:resources];
            } else {
                [DevToDev levelUp:level];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) realPayment:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * transactionId = [command.arguments objectAtIndex:0];
            NSNumber * inAppPrice = [command.arguments objectAtIndex:1];
            NSString * inAppName = [command.arguments objectAtIndex:2];
            NSString * inAppIsoCode = [command.arguments objectAtIndex:3];

            [DevToDev realPayment:transactionId withInAppPrice:[inAppPrice floatValue] andInAppName:inAppName andInAppCurrencyISOCode:inAppIsoCode];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) socialNetworkConnect:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * socialNetworkName = [command.arguments objectAtIndex:0];
            SocialNetwork * socialNetwork = [SocialNetwork Custom:socialNetworkName];
            [DevToDev socialNetworkConnect:socialNetwork];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) socialNetworkPost:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * socialNetworkName = [command.arguments objectAtIndex:0];
            NSString * reason = [command.arguments objectAtIndex:1];
            [DevToDev socialNetworkPost:[SocialNetwork Custom:socialNetworkName] withReason:reason];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) inAppPurchase:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * purchaseId = [command.arguments objectAtIndex:0];
            NSString * purchaseType = [command.arguments objectAtIndex:1];
            NSInteger purchaseAmount = [[command.arguments objectAtIndex:2] integerValue];
            id four = [command.arguments objectAtIndex:3];
 
            if ([four isKindOfClass:[NSDictionary class]]) {
                [DevToDev inAppPurchase:purchaseId withPurchaseType:purchaseType andPurchaseAmount:purchaseAmount andResources:four];
            } else {
                NSInteger purchasePrice = [[command.arguments objectAtIndex:3] integerValue];
                NSString * purchaseCurrency = [command.arguments objectAtIndex:4];
                
                [DevToDev inAppPurchase:purchaseId withPurchaseType:purchaseType andPurchaseAmount:purchaseAmount andPurchasePrice:purchasePrice andPurchaseCurrency:purchaseCurrency];
            }
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) customEvent:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * eventName = [command.arguments objectAtIndex:0];
            NSDictionary * params = [command.arguments objectAtIndex:1];
            if (params && params != (id)[NSNull null] && params.count > 0) {
                CustomEventParams * eventParams = [[CustomEventParams alloc] init];
                for (NSString* key in params) {
                    id value = [params objectForKey:key];
                    
                    if ([value isKindOfClass:[NSString class]]) {
                        [eventParams putParam:key withString:value];
                    } else if ([value isKindOfClass:[NSNumber class]]) {
                        if ([self numberIsFraction:value]) {
                            [eventParams putParam:key withDouble:[value doubleValue]];
                        } else {
                            [eventParams putParam:key withInt:[value intValue]];
                        }
                    }
                }
                [DevToDev customEvent:eventName withParams:eventParams];
            } else {
                [DevToDev customEvent:eventName];
            }
            
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) currencyAccrual:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSInteger amount = [[command.arguments objectAtIndex:0] integerValue];
            NSString * name = [command.arguments objectAtIndex:1];
            AccrualType type = [[command.arguments objectAtIndex:2] isEqualToString:@"purchased"] ? Purchased : Earned;
            [DevToDev currencyAccrual:amount withCurrencyName:name andCurrencyType:type];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setUserId:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * userId = [command.arguments objectAtIndex:0];
            [DevToDev setUserId:userId];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setCurrentLevel:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSInteger userLevel = [[command.arguments objectAtIndex:0] integerValue];
            [DevToDev setCurrentLevel:userLevel];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) getUserId:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * userId = [DevToDev getUserId];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:userId];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) replaceUserId:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * fromUserId = [command.arguments objectAtIndex:0];
            NSString * toUserId = [command.arguments objectAtIndex:1];
            [DevToDev replaceUserId:fromUserId to:toUserId];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) getSdkVersion:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * sdkVersion = [DevToDev sdkVersion];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:sdkVersion];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) registerForPushNotification:(CDVInvokedUrlCommand*) command
{
    [self.callbackIds setValue:command.callbackId forKey:@"registerForPushNotification"];

    [self.commandDelegate runInBackground:^{
        [[DevToDevPushManager pushManager] setDelegate:self];
    }];
}

-(void) didRegisterForRemoteNotificationsWithDeviceToken: (NSString *) deviceToken {
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceToken];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[self.callbackIds valueForKey:@"registerForPushNotification"]];
}

-(void) didFailToRegisterForRemoteNotificationsWithError: (NSError *) error {
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@"%@", error]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[self.callbackIds valueForKey:@"registerForPushNotification"]];
}

-(void) didReceiveRemoteNotification: (NSDictionary *) notification {
    [self dispatchPush:notification];
}

-(void)dispatchPush:(NSDictionary *)pushData {
    NSData *json = [NSJSONSerialization dataWithJSONObject:pushData options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];

    NSString *jsStatement = [NSString
        stringWithFormat:
            @"window.plugins.devtodev.notificationCallback(%@);",
            jsonString];
    [self.commandDelegate evalJs:[NSString stringWithFormat:@"setTimeout(function() { %@; }, 0);", jsStatement]];
}

-(BOOL) numberIsFraction:(NSNumber*)number {
    double dValue = [number doubleValue];
    if (dValue < 0.0)
        return (dValue != ceil(dValue));
    else
        return (dValue != floor(dValue));
}

@end