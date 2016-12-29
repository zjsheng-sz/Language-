//
//  JSView.m
//  photoConllectionMasonry
//
//  Created by robert on 2016/12/25.
//  Copyright © 2016年 ZJS. All rights reserved.
//

#import "JSView.h"
#import <Masonry.h>

@implementation JSView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    // --- Create your views here ---
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.button.backgroundColor = [UIColor redColor];
    [self addSubview:self.button];
    [self.button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout{
    
    return YES;
}

- (void)updateConstraints{
    
    NSLog(@"updateConstraints");
    // --- remake/update constraints here
    [self.button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.buttonSize.width));
        make.height.equalTo(@(self.buttonSize.height));
    }];
    
    [super updateConstraints];
}

- (void)didTapButton:(UIButton *)button {
    // --- Do your changes ie change variables that affect your layout etc ---
    self.buttonSize = CGSizeMake(200, 200);
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
}

@end
