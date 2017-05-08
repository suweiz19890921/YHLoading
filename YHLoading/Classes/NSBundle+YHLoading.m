//
//  NSBundle+YHLoadingView.m
//  Pods
//
//  Created by user on 2017/5/5.
//
//

#import "NSBundle+YHLoading.h"

@implementation NSBundle (YHLoading)

+ (NSBundle *)my_myLibraryBundle {
    return [self bundleWithURL:[self my_myLibraryBundleURL]];
}


+ (NSURL *)my_myLibraryBundleURL {
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"YHEmptyListView")];
    return [bundle URLForResource:@"YHLoading" withExtension:@"bundle"];
}

@end
