//
//  UIView+FTAdditions.m
//  Copyright (c) 2013:
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  All rights reserved.
//
//  Licensed under CC-BY-SA 3.0: http://creativecommons.org/licenses/by-sa/3.0/
//  You are free to share, adapt and make commercial use of the work as long as you give attribution and keep this license.
//  To give credit, we suggest this text: "Uses FTAdditions by Ortwin Gentz", with a link to the GitHub page

#import "UIView+FTAdditions.h"

@implementation UIView(FTAdditions)

#ifdef DEBUG

- (void) explode:(UIView*)aView level:(int)aLevel { 
	// indent to show the current level
	NSMutableString* out = [[NSMutableString alloc] init];
	[out appendFormat:@"%24s ", [NSStringFromCGRect([aView convertRect:aView.bounds toView:[[UIApplication sharedApplication] keyWindow]]) UTF8String]]; 
	for (int i = 0;  i < aLevel; i++) [out appendString:@"-"];
	// show the class and superclass for the current object 
	[out appendFormat:@"%@:%@ (%@)", [aView class], [aView superclass], aView]; 
	
	printf("%s\n", [out UTF8String]);
	
	// recurse for all subviews 
	for (UIView *subview in [aView subviews]) 
		[self explode:subview level:(aLevel + 1)];

	if (aView.subviews.count) {
		printf("\n");
	}
} 

- (void) explode {
	[self explode:self level:0];
}

- (void) path {
	NSMutableString* out = [[NSMutableString alloc] init];
	[out appendFormat:@"%24s ", [NSStringFromCGRect([self convertRect:self.bounds toView:[[UIApplication sharedApplication] keyWindow]]) UTF8String]]; 
	[out appendFormat:@"%@:%@ (%@)", [self class], [self superclass], self]; 
	printf("%s\n", [out UTF8String]);

	[self.superview path];
}
#endif

- (NSArray*)recursiveSubviewsOfKind:(Class)classname {
	if (self.subviews.count == 0) {
		return nil;
	}
	NSMutableArray *result = [NSMutableArray array];
	for (UIView *subview in [self subviews]) {
		if ([subview isKindOfClass:classname]) {
			[result addObject:subview];
		} else {
			NSArray *subResult = [subview recursiveSubviewsOfKind:classname];
			if (subResult) {
				[result addObjectsFromArray:subResult];
			}
		}
	}
	return result;
	
}

- (UIView*)superviewOfKind:(Class)classname {
	if ([self.superview isKindOfClass:classname]) {
		return self.superview;
	}
	return [self.superview superviewOfKind:classname];
}

- (id)traverseResponderChainForViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForViewController];
    } else {
        return nil;
    }
}

- (UIViewController*)ftViewController {
    return (UIViewController*)[self traverseResponderChainForViewController];
}
@end
