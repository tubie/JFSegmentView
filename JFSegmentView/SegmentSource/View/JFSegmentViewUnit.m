//
//

#import "JFSegmentViewUnit.h"

@implementation JFSegmentViewUnit

- (void)setView:(UIView *)view {
    if (_view) {
        [_view removeFromSuperview];
    }
    [self.contentView addSubview:view];
    [self setNeedsLayout];
    _view = view;
}

- (void)layoutSubviews {
    self.view.frame = self.contentView.bounds;
}


@end
