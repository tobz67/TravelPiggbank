//
//  AppearanceHelper.m
//  TravelPiggbank
//
//  Created by Toby Ambrose on 4/11/13.
//  Copyright (c) 2013 Toby Ambrose. All rights reserved.
//

#import "AppearanceHelper.h"
#import "Utilities.h"

@implementation AppearanceHelper

//#define kUIViewKey = @"UIView"
//#define kUILabelKey = @"UIView"
//#define kUITableViewCellKey = @"UIView"
//#define kUIViewKey = @"UIView"
//#define kUIViewKey = @"UIView"


#pragma mark Singleton Goodness

static AppearanceHelper *sharedHelper = nil;

+ (AppearanceHelper *) sharedHelper {
	@synchronized(self) {
        if (sharedHelper == nil) {
            sharedHelper = [[self alloc] init];
            sharedHelper.masterStyleDictionary = [Utilities loadPlistNamed:@"Styles"];
        }
	}
	return sharedHelper;
}

- (void)customizeAppearance {
    
    //    [[UIView appearance] setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_sand"]]];
    
   
    
    
    // Create resizable images
    UIImage *gradientImage44 = [[UIImage imageNamed:@"surf_gradient_textured_44"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImage *gradientImage32 = [[UIImage imageNamed:@"surf_gradient_textured_32"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    // Set the background image for *all* UINavigationBars
    [[UINavigationBar appearance] setBackgroundImage:gradientImage44
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:gradientImage32
                                       forBarMetrics:UIBarMetricsLandscapePhone];
    
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
      UITextAttributeTextColor,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
      UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
      UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"Arial-Bold" size:0.0],
      UITextAttributeFont,
      nil]];
    
    
    // bar buttons
    
//    UIImage *button30 = [[UIImage imageNamed:@"button_textured_30"]
//                         resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
//    UIImage *button24 = [[UIImage imageNamed:@"button_textured_24"]
//                         resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
//    [[UIBarButtonItem appearance] setBackgroundImage:button30 forState:UIControlStateNormal
//                                          barMetrics:UIBarMetricsDefault];
//    [[UIBarButtonItem appearance] setBackgroundImage:button24 forState:UIControlStateNormal
//                                          barMetrics:UIBarMetricsLandscapePhone];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:220.0/255.0 green:104.0/255.0 blue:1.0/255.0 alpha:1.0],
      UITextAttributeTextColor,
      [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0],
      UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, 1)],
      UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"AmericanTypewriter" size:0.0],
      UITextAttributeFont,
      nil]
                                                forState:UIControlStateNormal];
    
//    UIImage *buttonBack30 = [[UIImage imageNamed:@"button_back_textured_30"]
//                             resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
//    UIImage *buttonBack24 = [[UIImage imageNamed:@"button_back_textured_24"]
//                             resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 5)];
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack30
//                                                      forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack24
//                                                      forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    
    //UITab bar
//    UIImage *tabBackground = [[UIImage imageNamed:@"tab_bg"]
//                              resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//    [[UITabBar appearance] setBackgroundImage:tabBackground];
//    [[UITabBar appearance] setSelectionIndicatorImage:
//     [UIImage imageNamed:@"tab_select_indicator"]];
    
    
    // ui slider
//    UIImage *minImage = [[UIImage imageNamed:@"slider_minimum.png"]
//                         resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
//    UIImage *maxImage = [[UIImage imageNamed:@"slider_maximum.png"]
//                         resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
//    UIImage *thumbImage = [UIImage imageNamed:@"thumb.png"];
    
//    [[UISlider appearance] setMaximumTrackImage:maxImage
//                                       forState:UIControlStateNormal];
//    [[UISlider appearance] setMinimumTrackImage:minImage
//                                       forState:UIControlStateNormal];
//    [[UISlider appearance] setThumbImage:thumbImage
//                                forState:UIControlStateNormal];
    
    
//    // ui segmented control
//    
//    UIImage *segmentSelected = [[UIImage imageNamed:@"segcontrol_sel.png"]
//                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
//    UIImage *segmentUnselected = [[UIImage imageNamed:@"segcontrol_uns.png"]
//                                  resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
//    UIImage *segmentSelectedUnselected = [UIImage imageNamed:@"segcontrol_sel-uns.png"];
//    UIImage *segUnselectedSelected = [UIImage imageNamed:@"segcontrol_uns-sel.png"];
//    UIImage *segmentUnselectedUnselected = [UIImage imageNamed:@"segcontrol_uns-uns.png"];
//    
//    [[UISegmentedControl appearance] setBackgroundImage:segmentUnselected
//                                               forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [[UISegmentedControl appearance] setBackgroundImage:segmentSelected
//                                               forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//    
//    [[UISegmentedControl appearance] setDividerImage:segmentUnselectedUnselected
//                                 forLeftSegmentState:UIControlStateNormal
//                                   rightSegmentState:UIControlStateNormal
//                                          barMetrics:UIBarMetricsDefault];
//    [[UISegmentedControl appearance] setDividerImage:segmentSelectedUnselected
//                                 forLeftSegmentState:UIControlStateSelected
//                                   rightSegmentState:UIControlStateNormal
//                                          barMetrics:UIBarMetricsDefault];
//    
//    [[UISegmentedControl appearance]
//     setDividerImage:segUnselectedSelected
//     forLeftSegmentState:UIControlStateNormal
//     rightSegmentState:UIControlStateSelected
//     barMetrics:UIBarMetricsDefault];
//    
//    // ui switch
//    [[UISwitch appearance] setOnTintColor:[UIColor colorWithRed:0 green:175.0/255.0 blue:176.0/255.0 alpha:1.0]];
    
    [[UILabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16.0]];
    //    [[UILabel appearanceWhenContainedIn:[UITableViewCell class], nil] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16.0]];
    [[UITableViewCell appearance] setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16.0]];
    
    [[UITextField appearance] setBackground:[[UIImage imageNamed:@"text_field_teal.png"]
                                             resizableImageWithCapInsets:UIEdgeInsetsMake(15.0, 5.0, 15.0, 5.0)]];
}
//
//# pragma mark - Plist parsing methods
//
//-(UIColor*) parseColor:(NSString*)colorKey fromStyleDictionary:(NSDictionary*) styleDictionary {
//    NSString* rgbColors = [styleDictionary objectForKey:colorKey];
//    if (rgbColors != nil) {
//        NSArray *components = [rgbColors componentsSeparatedByString:@","];
//        if ([components count] == 4)
//        {
//            return [UIColor colorWithRed: ([[components objectAtIndex:0] intValue]/255.0) green: ([[components objectAtIndex:1] intValue]/255.0) blue: ([[components objectAtIndex:2] intValue]/255.0) alpha: [[components objectAtIndex:3] intValue]/255.0];
//        }
//        return [UIColor colorWithRed: ([[components objectAtIndex:0] intValue]/255.0) green: ([[components objectAtIndex:1] intValue]/255.0) blue: ([[components objectAtIndex:2] intValue]/255.0) alpha: 1.000];
//    }
//    return nil;
//}
//
//-(UIFont*) parseFont:(NSString*)fontKey fromStyleDictionary:(NSDictionary*) styleDictionary {
//    NSString* fontString = [styleDictionary objectForKey:fontKey];
//    if (fontString != nil) {
//        
//        NSArray *components = [fontString componentsSeparatedByString:@":"];
//        NSString *fontName = [components objectAtIndex:0];
//        // pull the font name from the defaults
//        if ([fontName isEqualToString:kDefaultFontKey] || [fontName isEqualToString:kDefaultFontBoldKey]) {
//            NSDictionary *defaults = [masterStyleDictionary objectForKey:kDefaultsKey];
//            NSString *defaultFontName = [defaults objectForKey:fontName];
//            fontName = defaultFontName;
//        }
//        
//        return (UIFont*)[UIFont fontWithName:fontName size:[[components objectAtIndex:1] floatValue]];
//    }
//    return (UIFont*)[UIFont systemFontOfSize: [UIFont systemFontSize]];
//}
//
//-(UIImage*) parseImage:(NSString*)imgKey fromStyleDictionary:(NSDictionary*) styleDictionary {
//    NSString* imgName = [styleDictionary objectForKey:imgKey];
//    UIImage *img = nil;
//    if (imgName != nil) {
//        img = [UIImage imageNamed:imgName];
//    }
//    return img;
//}
//
//-(UIEdgeInsets) parseEdgeInsets:(NSString*)colorKey fromStyleDictionary:(NSDictionary*) styleDictionary {
//    NSString* insetsString = [styleDictionary objectForKey:colorKey];
//    if (insetsString != nil) {
//        NSArray *insets = [insetsString componentsSeparatedByString:@","];
//        return UIEdgeInsetsMake([[insets objectAtIndex:0] floatValue], [[insets objectAtIndex:1] floatValue], [[insets objectAtIndex:2] floatValue], [[insets objectAtIndex:3] floatValue]);
//    }
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}
//
//-(CGSize) parseCGSize:(NSString*)sizeKey fromStyleDictionary:(NSDictionary*) styleDictionary {
//    NSString* sizeString = [styleDictionary objectForKey:sizeKey];
//    if (sizeString != nil) {
//        NSArray *sizes = [sizeString componentsSeparatedByString:@","];
//        return CGSizeMake([[sizes objectAtIndex:0] floatValue], [[sizes objectAtIndex:1] floatValue]);
//    }
//    return CGSizeMake(0.0, 0.0);
//}


@end
