#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CDVNativeShare : CDVPlugin {
}

- (void)share:(CDVInvokedUrlCommand*)command;

@end