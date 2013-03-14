//
//  FTButton.m
//  Copyright (c) 2013:
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  All rights reserved.
//
//  Licensed under CC-BY-SA 3.0: http://creativecommons.org/licenses/by-sa/3.0/
//  You are free to share, adapt and make commercial use of the work as long as you give attribution and keep this license.
//  To give credit, we suggest this text: "Uses FTAdditions by Ortwin Gentz", with a link to the GitHub page

#import "FTButton.h"

@implementation FTButton

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super hitTest:point withEvent:event];
    }
    // The point that is being tested is relative to self, so remove origin
    CGRect relativeFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    if(CGRectContainsPoint(hitFrame, point)) {
        return self;
    }
    return nil;
}

- (CGSize)sizeThatFits:(CGSize)size {
	size = [super sizeThatFits:size];
	size.width += self.titleEdgeInsets.left + self.titleEdgeInsets.right;
	size.height += self.titleEdgeInsets.top + self.titleEdgeInsets.bottom;
	return size;
}
@end
