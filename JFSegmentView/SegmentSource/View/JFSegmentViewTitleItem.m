////http://www.jianshu.com/p/24e15b39c603
//  https://github.com/tubie/JFSegmentView
//

#import "JFSegmentViewTitleItem.h"
#import "UIView+Size.h"

#define _defaultFont [UIFont systemFontOfSize:15]

#define _defaultTitleColor_Normal     [UIColor blackColor]
#define _defaultTitleColor_Highlight  [UIColor redColor]

#define _MinWidth  32
#define _MaxWidth  [UIScreen mainScreen].bounds.size.width / 2

@interface JFSegmentViewTitleItem () {
    BOOL _hasNormalColor;
    BOOL _hasHighlightColor;
    BOOL _touchedFlag;
    id _target;
    SEL _action;
}
@property(nonatomic, strong) UILabel *titleLabel;


@end

@implementation JFSegmentViewTitleItem

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        self.space = 8;
        self.title = title;
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat buttonWidth = [self calcuWidth];
    self.frame = CGRectMake(self.x, self.y, buttonWidth + self.space, self.height);
    self.titleLabel.frame = CGRectMake(self.space / 2, 0, buttonWidth, self.height);
}

- (CGFloat)calcuWidth {
    if (self.title == nil) {
        return _MinWidth;
    }
    UIFont *font = self.font == nil ? _defaultFont : self.font;
    CGRect frame = [self.title boundingRectWithSize:CGSizeMake(_MaxWidth, self.height) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    CGFloat width = frame.size.width;
    return width > _MinWidth ? width : _MinWidth;
}

+ (CGFloat)calcuWidth:(NSString *)title {
    JFSegmentViewTitleItem *item = [[JFSegmentViewTitleItem alloc] initWithFrame:(CGRectZero) title:title];
    return [item calcuWidth] + item.space;
}

//*************** 个性化 *******************
- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    _hasNormalColor = YES;
    [self setHighlight:_highlight];
}

- (void)setHighlightColor:(UIColor *)highlightColor {
    _highlightColor = highlightColor;
    _hasHighlightColor = YES;
    [self setHighlight:_highlight];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    [self setNeedsLayout];
}

- (void)setFont:(UIFont *)font {
    self.titleLabel.font = font;
}

- (void)setSpace:(CGFloat)space {
    _space = space;
    [self setNeedsLayout];
}

- (void)setHighlight:(BOOL)highlight {
    _highlight = highlight;
    self.titleLabel.textColor = highlight == YES ? _hasHighlightColor == YES ? self.highlightColor : _defaultTitleColor_Highlight : _hasNormalColor == YES ? self.normalColor : _defaultTitleColor_Normal;
}


//************* touches ******************

- (void)addTarget:(id)target action:(SEL)action {
    _target = target;
    _action = action;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint touchPoint = [touch locationInView:self];
    if (touchPoint.x >= 0 && touchPoint.x <= self.width && touchPoint.y >= 0 && touchPoint.y <= self.height) {
        [UIView animateWithDuration:0.1 animations:^{
            self.alpha = 0.2;
            _touchedFlag = YES;
        }];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint touchPoint = [touch locationInView:self];
    if (touchPoint.x >= 0 && touchPoint.x <= self.width && touchPoint.y >= 0 && touchPoint.y <= self.height) {
        if (_touchedFlag) {
            [_target performSelector:_action withObject:self];
        }
    }
    _touchedFlag = NO;
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 1;
    }];
}

//************ lazy **************
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.textColor = _defaultTitleColor_Normal;
        _titleLabel.font = _defaultFont;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}


@end
