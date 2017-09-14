
////http://www.jianshu.com/p/24e15b39c603
//  https://github.com/tubie/JFSegmentView

#import <UIKit/UIKit.h>

@interface JFSegmentView : UIView

///非选中颜色
@property(nonatomic, strong) UIColor *normalColor;
///选中颜色
@property(nonatomic, strong) UIColor *highlightColor;
///字体
@property(nonatomic, strong) UIFont *font;

- (instancetype)initWithFrame:(CGRect)frame titleHeight:(CGFloat)height viewControllers:(NSArray <UIViewController *> *)viewControllers;

@end
