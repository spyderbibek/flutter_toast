#import "FluttertoastPlugin.h"
#if __has_include(<fluttertoast/fluttertoast-Swift.h>)
#import <fluttertoast/fluttertoast-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fluttertoast-Swift.h"
#endif

@implementation FluttertoastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFluttertoastPlugin registerWithRegistrar:registrar];
}
@end
