//
//  RSSegmentedControl.h
//  RSSegmentedControl
//
//  Created by rsers on 16/7/13.
//  Copyright © 2016年 rsers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@protocol RSSegmentedControlDelegate <NSObject>
- (void)segmentDidSelect:(NSInteger)index;
@end


@interface RSSegmentedControl : UIView
@property(nonatomic,strong) id <RSSegmentedControlDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                         font:(CGFloat)font
                 normalColour:(UIColor *)normalColour
               selectedColour:(UIColor *)selectedColour
                indicatorSize:(CGSize)indicatorSize
              indicatorColour:(UIColor *)indicatorColour;
@end
