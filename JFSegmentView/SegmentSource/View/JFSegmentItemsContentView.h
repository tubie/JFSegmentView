
////http://www.jianshu.com/p/24e15b39c603
//  https://github.com/tubie/JFSegmentView

#import <UIKit/UIKit.h>
#import "JFSegmentViewTitleItem.h"

@protocol JFSegmentItemsContentViewDelegate;

@interface JFSegmentItemsContentView : UIView

@property(nonatomic, assign) id <JFSegmentItemsContentViewDelegate> delegate;

//@property (nonatomic,assign) BOOL touching;

@property(nonatomic, assign) NSInteger page;

///非选中颜色
@property(nonatomic, strong) UIColor *normalColor;
///选中颜色
@property(nonatomic, strong) UIColor *highlightColor;
///字体
@property(nonatomic, strong) UIFont *font;


- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray <NSString *> *)titles;

@end

@protocol JFSegmentItemsContentViewDelegate <NSObject>
- (void)didSelectedButtonAtIndex:(NSInteger)index;
@end
