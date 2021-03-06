#import "DevToDevPlugin.h"
#import <devtodev/devtodev.h>

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

- (void)pluginInitialize
{
    NSLog(@"DevToDev plugin init.");
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

- (void) setTrackingAvailability:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            BOOL isTrackingAvailable = [[command.arguments objectAtIndex:0] isEqualToString:@"YES"] ? YES : NO;
            [DevToDev setTrackingAvailability:isTrackingAvailable];
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

- (void) startProgressionEvent:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * eventName = [command.arguments objectAtIndex:0];
            NSDictionary * params = [command.arguments objectAtIndex:1];
            if (params && params != (id)[NSNull null] && params.count > 0) {
                LocationEventParams * startParams = [self generateParams:params];
                [DevToDev startProgressionEvent:eventName withParameters:startParams];
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:@"EventParams needed"];
            }
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}
    
- (void) endProgressionEvent:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * eventName = [command.arguments objectAtIndex:0];
            NSDictionary * params = [command.arguments objectAtIndex:1];
            if (params && params != (id)[NSNull null] && params.count > 0) {
                LocationEventParams * endParams = [self generateParams:params];
                [DevToDev endProgressionEvent:eventName withParameters:endParams];
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                 messageAsString:@"EventParams needed"];
            }
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (LocationEventParams *) generateParams: (NSDictionary *) params {
    LocationEventParams * eventParams = [[LocationEventParams alloc] init];

    for (NSString * key in params) {
        id value = [params objectForKey: key];
        NSString * lowercaseKey = [key lowercaseString];
        if ([lowercaseKey isEqualToString:@"difficulty"]) {
            [eventParams setDifficulty:[value integerValue]];
        } else if ([lowercaseKey isEqualToString:@"source"]) {
            [eventParams setSource:value];
        } else if ([lowercaseKey isEqualToString:@"success"]) {
            [eventParams setIsSuccess:value];
        } else if ([lowercaseKey isEqualToString:@"duration"]) {
            [eventParams setDuration:value];
        } else if ([lowercaseKey isEqualToString:@"earned"]) {
            NSMutableDictionary * earned = [[NSMutableDictionary alloc] init];
            NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            
            for (NSString *earnedKey in value) {
                [earned setObject:[formatter numberFromString:[value objectForKey:earnedKey]] forKey:earnedKey];
            }
            [eventParams setEarned:earned];
        } else if ([lowercaseKey isEqualToString:@"spent"]) {
            NSMutableDictionary * spent = [[NSMutableDictionary alloc] init];
            NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            
            for (NSString *spentKey in value) {
                [spent setObject:[formatter numberFromString:[value objectForKey:spentKey]] forKey:spentKey];
            }
            [eventParams setSpent:spent];
        }
    }

    return eventParams;
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

- (void) referrer:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSDictionary * input = [command.arguments objectAtIndex:0];
            NSMutableDictionary * output = [[NSMutableDictionary alloc] init];
            for(NSString * key in input) {
                NSString * adKey = key;
                if ([[key lowercaseString] isEqualToString:@"source"]) {
                    adKey = @"publisher";
                } else if ([[key lowercaseString] isEqualToString:@"medium"]) {
                    adKey = @"subplacement";
                } else if ([[key lowercaseString] isEqualToString:@"content"]) {
                    adKey = @"subad";
                } else if ([[key lowercaseString] isEqualToString:@"campaign"]) {
                    adKey = @"subcampaign";
                } else if ([[key lowercaseString] isEqualToString:@"term"]) {
                    adKey = @"subkeyword";
                }
                ReferralProperty *propertyKey = [ReferralProperty Custom:adKey];
                [output setObject:[input objectForKey:key] forKey:propertyKey];
            }
            [DevToDev referrer:output];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

//
// User card methods
//

- (void) setName:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * name = [command.arguments objectAtIndex:0];
            DevToDev.activeUser.name = name;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setCheater:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            BOOL isCheater = [[command.arguments objectAtIndex:0] isEqualToString:@"YES"] ? YES : NO;
            DevToDev.activeUser.cheater = isCheater;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setAge:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSInteger age = [[command.arguments objectAtIndex:0] integerValue];
            DevToDev.activeUser.age = age;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setGender:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSInteger gender = [[command.arguments objectAtIndex:0] integerValue];
            DevToDev.activeUser.gender = gender;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setEmail:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * email = [command.arguments objectAtIndex:0];
            DevToDev.activeUser.email = email;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setPhone:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * phone = [command.arguments objectAtIndex:0];
            DevToDev.activeUser.phone = phone;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setPhoto:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSString * photo = [command.arguments objectAtIndex:0];
            DevToDev.activeUser.photo = photo;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) setUserData:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSDictionary * dataDictionary = [command.arguments objectAtIndex:0];
            [DevToDev.activeUser setUserData:dataDictionary];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) unsetUserData:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSArray * keys = [command.arguments objectAtIndex:0];
            [DevToDev.activeUser unsetUserData:keys];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) clearUserData:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            [DevToDev.activeUser clearUserData];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) appendUserData:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSDictionary * dataDictionary = [command.arguments objectAtIndex:0];
            [DevToDev.activeUser append:dataDictionary];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) incrementUserData:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSDictionary * dataDictionary = [command.arguments objectAtIndex:0];
            NSMutableDictionary * formattedDictionary = [[NSMutableDictionary alloc] init];
            NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            
            for (NSString *key in dataDictionary) {
                [formattedDictionary setObject:[formatter numberFromString:[dataDictionary objectForKey:key]] forKey:key];
            }
            
            [DevToDev.activeUser increment:formattedDictionary];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) unionUserData:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        
        @try {
            NSDictionary * dataDictionary = [command.arguments objectAtIndex:0];
            [DevToDev.activeUser unionWithData:dataDictionary];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                             messageAsString:[exception reason]];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

//
// Push-Notification methods
//

- (void) registerForPushNotification:(CDVInvokedUrlCommand*) command {
    [self.callbackIds setValue:command.callbackId forKey:@"registerForPushNotification"];

    [DevToDev pushManager].pushNotificationsEnabled = YES;
    [DevToDev pushManager].delegate = self;
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

-(void) didOpenRemoteNotification: (DTDPushMessage *) pushMessage withAction: (DTDActionButton *) actionButton {
    [self dispatchPushMessage: pushMessage withActionButton: actionButton];
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

- (void) dispatchPushMessage: (DTDPushMessage *) pushMessage withActionButton: (DTDActionButton *) actionButton {
    NSData * messageData = [NSJSONSerialization dataWithJSONObject:pushMessage.data options:NSJSONWritingPrettyPrinted error:nil];
    NSString * messageString = [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding];
    NSString * actionString = @"undefined";
    if (actionButton) {
        NSData * actionData = [NSJSONSerialization dataWithJSONObject:actionButton.dictionary options:NSJSONWritingPrettyPrinted error:nil];
        actionString = [[NSString alloc] initWithData:actionData encoding:NSUTF8StringEncoding];
    }
    
    NSString *jsStatement = [NSString
                             stringWithFormat:
                             @"window.plugins.devtodev.notificationOpenCallback(%@, %@);",
                             messageString, actionString];
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
