#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "error" asset catalog image resource.
static NSString * const ACImageNameError AC_SWIFT_PRIVATE = @"error";

/// The "info" asset catalog image resource.
static NSString * const ACImageNameInfo AC_SWIFT_PRIVATE = @"info";

/// The "success" asset catalog image resource.
static NSString * const ACImageNameSuccess AC_SWIFT_PRIVATE = @"success";

#undef AC_SWIFT_PRIVATE
