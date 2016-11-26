#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

@interface DevToDevPlugin : CDVPlugin {
    NSMutableDictionary *callbackIds;
}

@property (nonatomic, retain) NSMutableDictionary *callbackIds;

@end