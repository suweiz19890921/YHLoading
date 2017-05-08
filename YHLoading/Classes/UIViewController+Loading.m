//
//  UIViewController+Loading.m
//  Pods
//
//  Created by user on 2017/5/5.
//
//

#import "UIViewController+Loading.h"
#import "YHEmptyListView.h"
#import <objc/runtime.h>
@interface UIViewController ()

@property (nonatomic, strong)YHEmptyListView *emptyView;

@end
static char *YHEmptyListViewKey = "YHEmptyListViewKey";
@implementation UIViewController (Loading)

- (void)showLoading {
    self.emptyView.frame = self.view.bounds;
    [self.view addSubview:self.emptyView];
    [self.emptyView setTitle:@"正在玩命加载中" type:YHEmptyListLoading];
    
}

- (void)hide {
    [self.emptyView setHidden:YES animated:YES];
}


#pragma mark 功能扩展
- (void)showError {
    
}

- (void)showNodata {
    
}

#pragma mark lazy load 
-(void)setEmptyView:(NSString *)emptyView{
    objc_setAssociatedObject(self, YHEmptyListViewKey, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(YHEmptyListView *)emptyView{
    YHEmptyListView *tempEmptyView = objc_getAssociatedObject(self, YHEmptyListViewKey);
    if (tempEmptyView == nil) {
        tempEmptyView = [YHEmptyListView new];
        self.emptyView = tempEmptyView;
    }
    return tempEmptyView;
}

@end
