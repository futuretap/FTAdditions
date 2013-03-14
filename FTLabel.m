//
//  FTLabel.m
//  Copyright (c) 2013:
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  All rights reserved.
//
//  Licensed under CC-BY-SA 3.0: http://creativecommons.org/licenses/by-sa/3.0/
//  You are free to share, adapt and make commercial use of the work as long as you give attribution and keep this license.
//  To give credit, we suggest this text: "Uses FTAdditions by Ortwin Gentz", with a link to the GitHub page

#import "FTLabel.h"

@interface FTLabel ()
@property(nonatomic, strong) UIColor *savedShadowColor;
@property(nonatomic) CGSize savedShadowOffset;
@end

@implementation FTLabel

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self configure];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		[self configure];
	}
	return self;
}

- (void)configure {
	self.highlightedShadowColor = nil;

	self.highlightedShadowOffset = CGSizeMake(self.shadowOffset.width * (-1), self.shadowOffset.height * (-1));
	
	self.savedShadowColor = self.shadowColor;
	self.savedShadowOffset = self.shadowOffset;
}

- (void)setShadowColor:(UIColor*)shadowColor {
	self.savedShadowColor = shadowColor;
	[super setShadowColor:shadowColor];
}

- (void)setShadowOffset:(CGSize)shadowOffset {
	self.savedShadowOffset = shadowOffset;
	[super setShadowOffset:shadowOffset];
}

- (void)setHighlighted:(BOOL)highlighted {
	[super setHighlighted:highlighted];
	
	super.shadowColor = self.highlighted ? self.highlightedShadowColor : self.savedShadowColor;
	super.shadowOffset = self.highlighted ? self.highlightedShadowOffset : self.savedShadowOffset;
}

@end
