//
//  YHEmptyListView.m
//  Copyright (c) 2017 . All rights reserved.
//

#import "YHEmptyListView.h"
#import <Masonry/Masonry.h>
#import "UIImage+YHLoading.h"
@interface YHEmptyListView ()
@property (nonatomic) UIImageView *emptyImageView;
@property (nonatomic) UILabel *msgLabel;

@end

@implementation YHEmptyListView

- (id)initWithFrame:(CGRect)frame withText:(NSString *)text
{
    if (self = [super initWithFrame:frame]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.msgLabel = [UILabel new];
        self.msgLabel.textColor = [UIColor grayColor];
        self.msgLabel.font = [UIFont systemFontOfSize:15];
        self.msgLabel.text = text;
        self.msgLabel.textAlignment = NSTextAlignmentCenter;
        
        self.emptyImageView = [[UIImageView alloc] init];
        
        [self addSubview:self.emptyImageView];
        [self addSubview:self.msgLabel];

        [self.emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self.mas_top).offset(150);
            make.width.and.height.equalTo(@200);
        }];
        
        [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.emptyImageView.mas_bottom);
        }];
        

    }
    return self;
}

- (id)init
{
    
    if (self = [super init]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.msgLabel = [UILabel new];
        self.msgLabel.textColor = [UIColor grayColor];
        self.msgLabel.font = [UIFont systemFontOfSize:15];
        self.msgLabel.textAlignment = NSTextAlignmentCenter;
        
        self.emptyImageView = [[UIImageView alloc] init];
        self.emptyImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self addSubview:self.emptyImageView];
        [self addSubview:self.msgLabel];
        
        [self.emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            if ([UIScreen mainScreen].bounds.size.height == 480) {
                make.centerY.equalTo(self).with.offset(-60);
            } else {
                make.centerY.equalTo(self).with.offset(-100);
            }
            make.width.and.height.equalTo(@200);
        }];
        
        [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.emptyImageView.mas_bottom);
        }];
    }

    return self;
}

- (void)setTitle:(NSString *)string type:(BBPadEmptyListType)type
{
    if (self.superview) {
        [self.superview bringSubviewToFront:self];
    }
    self.emptyImageView.contentMode = UIViewContentModeScaleAspectFill;

    self.msgLabel.hidden = string.length <= 0;
    [self.msgLabel setText:string];
    
    [self.emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.mas_top).offset(150);
        make.width.and.height.equalTo(@200);
    }];

    self.emptyImageView.animationImages = nil;
    if (type == YHEmptyListLoading) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (NSInteger i = 1; i <= 8; i++) {
            NSString *imageName = [NSString stringWithFormat:@"common_pay_loading_hd_%zd",i];
            UIImage *image = [UIImage my_bundleImageNamed:imageName];
            [arr addObject:image];
        }
        self.emptyImageView.animationImages = arr;
        self.emptyImageView.animationDuration = 1.0f;
        self.emptyImageView.animationRepeatCount = 0;
        self.emptyImageView.contentMode = UIViewContentModeScaleAspectFit;
    } else if (type == YHEmptyListNoData) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"videoInfo_empty_hd"]];
    } else if (type == YHEmptyListNoFeedBack) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"空评论"]];
    } else if (type == YHEmptyListNoNetwork) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"noNetWork_hd"]];
    } else if (type == YHEmptyListNoSearchHistory) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"empty_list_no_search_history.png"]];
    } else if (type == YHEmptyListShouldRefresh) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"common_loading_noData"]];
    }else if (type == YHEmptyListNoBodyContract) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"misc_battery_noData"]];
    }else if (type == YHEmptyListBangumiTimelineNoData){
         [self.emptyImageView setImage:[UIImage imageNamed:@"bangumi_timeline_nodata"]];
         self.emptyImageView.contentMode = UIViewContentModeScaleAspectFit;
    } else if (type == YHEmptyListHDCachePageNoData) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"cachePage_empty_hd"]];
    } else if (type == YHEmptyListHDSearchPageGoSearching) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"searchPage_letsGoSearching"]];
    } else if (type == YHEmptyListHDSearchPageSearchingNoting) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"noSearchResult_hd"]];
    } else if (type == YHEmptyListHDEpFavouritePageNoData) {
        [self.emptyImageView setImage:[UIImage imageNamed:@"epFavouritePage_empty_hd"]];
    }
    if ([self.emptyImageView isAnimating]) {
        [self.emptyImageView stopAnimating];
    }
    [self.emptyImageView startAnimating];
}
- (void)setTitle:(NSString *)string type:(BBPadEmptyListType)type btnPressedBlock:(void (^)(void))block;
{
    [self setTitle:string type:type];
}

- (void)showImmediately
{
    [super setHidden:NO];
}

- (void)setHidden:(BOOL)hidden
{
    [self setHidden:hidden animated:YES];
}

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated
{
    if (self.hidden == hidden) {
        return;
    }
    [super setHidden:hidden];
    
    if (!hidden) {
        if (animated) {
            self.alpha = 0.0f;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.5 animations:^{
                    self.alpha = 1.0f;
                } completion:^(BOOL finish) {
                    [self.emptyImageView startAnimating];
                }];
            });
        } else {
            [self.emptyImageView startAnimating];
        }
    }
}


@end
