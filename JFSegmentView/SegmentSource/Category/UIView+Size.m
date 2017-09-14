//
//

#import "UIView+Size.h"

@implementation UIView (Size)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (CGFloat)height {
    return self.bounds.size.height;
}

- (CGFloat)left {
    return self.x;
}

- (CGFloat)right {
    return self.x + self.width;
}

- (CGFloat)top {
    return self.y;
}

- (CGFloat)bottom {
    return self.y + self.height;
}

- (CGFloat)centerX {
    return self.width / 2;
}

- (CGFloat)centerY {
    return self.height / 2;
}

@end
