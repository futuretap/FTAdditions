//
//  UIView+FTAdditions.h
//  Copyright (c) 2013:
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  All rights reserved.
//
//  Licensed under CC-BY-SA 3.0: http://creativecommons.org/licenses/by-sa/3.0/
//  You are free to share, adapt and make commercial use of the work as long as you give attribution and keep this license.
//  To give credit, we suggest this text: "Uses FTAdditions by Ortwin Gentz", with a link to the GitHub page

#import <Foundation/Foundation.h>

@interface UIView(FTAdditions)

#ifdef DEBUG
- (void) explode;
- (void) path;
#endif

- (NSArray*)recursiveSubviewsOfKind:(Class)classname;
- (UIView*)superviewOfKind:(Class)classname;

@property (nonatomic, readonly) UIViewController* ftViewController;

@end
