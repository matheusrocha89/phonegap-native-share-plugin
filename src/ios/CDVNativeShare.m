#import "CDVNativeShare.h"

@implementation CDVNativeShare

- (void)share:(CDVInvokedUrlCommand*)command {

  CDVPluginResult* pluginResult = nil;
  NSString* message = [command.arguments objectAtIndex:0];
  if (message != nil && [message length] > 0) {
    NSArray* activityItems = [[NSArray alloc] initWithObjects:message, nil, nil, nil];

    UIActivity* activity = [[UIActivity alloc] init];

    NSArray* applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
    UIActivityViewController* activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:applicationActivities];
    [self.viewController presentViewController:activityVC animated:YES completion:nil];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
  } else {
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
  }

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
