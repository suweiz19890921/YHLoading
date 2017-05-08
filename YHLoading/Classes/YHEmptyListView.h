//
//  YHEmptyListView.h

//  Copyright (c) 2017 All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BBPadEmptyListType) {
    YHEmptyListNoData,
    YHEmptyListNoFeedBack,
    YHEmptyListLoading,
    YHEmptyListNoNetwork,
    YHEmptyListNoSearchHistory,
    YHEmptyListShouldLogin,
    YHEmptyListShouldRefresh,
    YHEmptyListNoBodyContract,
    YHEmptyListBangumiTimelineNoData,
    YHEmptyListHDCachePageNoData,
    YHEmptyListHDSearchPageGoSearching,
    YHEmptyListHDSearchPageSearchingNoting,
    YHEmptyListHDEpFavouritePageNoData
};


@interface YHEmptyListView : UIView

@property (nonatomic, readonly) UIImageView *emptyImageView;
@property (nonatomic, readonly) UILabel *msgLabel;

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;
- (id)initWithFrame:(CGRect)frame withText:(NSString *)text;
- (id)init;
- (void)setTitle:(NSString *)string type:(BBPadEmptyListType)type;
- (void)setTitle:(NSString *)string type:(BBPadEmptyListType)type btnPressedBlock:(void (^)(void))block;
- (void)showImmediately;



@end
