//
//  UIImage+YHLoadingView.m
//  Pods
//
//  Created by user on 2017/5/5.
//
//

#import "UIImage+YHLoading.h"
#import "NSBundle+YHLoading.h"
@implementation UIImage (YHLoading)

+ (UIImage *)my_bundleImageNamed:(NSString *)name {
    return [self my_imageNamed:name inBundle:[NSBundle my_myLibraryBundle]];
}


+ (UIImage *)my_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    return [self imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
#else
    if ([self respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    } else {
        return [self imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
    }
#endif
}

@end
