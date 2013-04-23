//
//  UIView+FormScroll.h
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/15/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (FormScroll)

-(void)scrollToY:(float)y;
-(void)scrollToView:(UIView *)view;
-(void)scrollElement:(UIView *)view toPoint:(float)y;

@end
