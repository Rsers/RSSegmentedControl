//
//  RSSegmentedControl.m
//  RSSegmentedControl
//
//  Created by rsers on 16/7/13.
//  Copyright © 2016年 rsers. All rights reserved.
//

#import "RSSegmentedControl.h"


#define BaseTag 1000

@interface RSSegmentedControl()
@property(nonatomic,strong) NSArray *titles;
@property(nonatomic,assign) CGFloat titleFont;
@property(nonatomic,strong) UIColor *didSelectedColor;
@property(nonatomic,strong) UIColor *notSelectedColor;
@property(nonatomic,strong) UIView  *indicator;
@property(nonatomic,assign) CGFloat indicatorWidth;
@property(nonatomic,assign) CGFloat indicatorHeight;
@property(nonatomic,strong) UIColor *indicatorColor;;
@property(nonatomic,strong) NSMutableArray *buttonArray;
@end

@implementation RSSegmentedControl

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                         font:(CGFloat)font
                 normalColour:(UIColor *)normalColour
               selectedColour:(UIColor *)selectedColour
               indicatorSize:(CGSize)indicatorSize
              indicatorColour:(UIColor *)indicatorColour

{
    self = [super initWithFrame:frame];
    if (self) {
            //
            _notSelectedColor = normalColour;
            _didSelectedColor = selectedColour;
            _indicatorColor   = indicatorColour;
            _indicatorHeight  = indicatorSize.height;
            _indicatorWidth   = indicatorSize.width;
            _titleFont        = font;
            _buttonArray      = [NSMutableArray array];
            //
            self.backgroundColor = [UIColor whiteColor];
            //
            for (int i = 0; i < titles.count; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.titleLabel.font = [UIFont systemFontOfSize:_titleFont];
                button.titleLabel.textColor = [UIColor blackColor];
                [button setTitle:titles[i] forState:UIControlStateNormal];
                [button setTitleColor:_notSelectedColor forState:UIControlStateNormal];
                [button setTitleColor:_didSelectedColor forState:UIControlStateSelected];
                button.tag = BaseTag + i;
                [button addTarget:self action:@selector(touchSegment:) forControlEvents:UIControlEventTouchDown];
                [self addSubview:button];
                [_buttonArray addObject:button];
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(self.mas_width).multipliedBy(1/(CGFloat)(titles.count));
                    make.bottom.equalTo(self);
                    if (i == 0) {
                        make.left.equalTo(self);
                    }else{
                        UIButton *previous = _buttonArray[i-1];
                        make.left.equalTo(previous.mas_right);
                    }
                }];
            }
            //
            _indicator = [[UIView alloc] init];
            _indicator.backgroundColor = _indicatorColor;
            [self addSubview:_indicator];
            [_indicator mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self);
                make.width.mas_equalTo(@(_indicatorWidth));
                make.height.mas_equalTo(@(_indicatorHeight));
                make.centerX.equalTo(_buttonArray[0]);
            }];
            [_buttonArray[0] setSelected:YES];

    }
    //这句代码给定动画的起始位置,并让这个图形现在就画出来
    [self layoutIfNeeded];
    
    return self;
}


- (void)touchSegment:(UIButton *)button{
    NSInteger index = button.tag - BaseTag;
    NSLog(@"touchSegment ====== %ld",index);
    //
    if (button.selected) return;
    [_buttonArray setValue:@NO forKeyPath:@"selected"];//全部
    button.selected = YES;
    
    //滑块动画
    [UIView animateWithDuration:0.2 animations:^{
        [_indicator mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.width.mas_equalTo(@(_indicatorWidth));
            make.height.mas_equalTo(@(_indicatorHeight));
            UIButton *selected = _buttonArray[index];
            make.centerX.equalTo(selected);
        }];
        //相当于明确结束位置。下面这句代码告诉view现在就开始绘画，触发view开始变化，UIView这个类，把这个变化在时间段内匀速表现出来。
        [self layoutIfNeeded];
    }];
    
    //代理方法
    if (_delegate && [_delegate respondsToSelector:@selector(segmentDidSelect:)]) {
        [_delegate segmentDidSelect:index];
    }
    
}




@end




























