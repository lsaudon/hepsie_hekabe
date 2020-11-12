#import "HepsieHekabeInfrastructurePlugin.h"
#if __has_include(<hepsie_hekabe_infrastructure/hepsie_hekabe_infrastructure-Swift.h>)
#import <hepsie_hekabe_infrastructure/hepsie_hekabe_infrastructure-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "hepsie_hekabe_infrastructure-Swift.h"
#endif

@implementation HepsieHekabeInfrastructurePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHepsieHekabeInfrastructurePlugin registerWithRegistrar:registrar];
}
@end
