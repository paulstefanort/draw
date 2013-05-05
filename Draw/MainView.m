//
//  MainView.m
//  Draw
//
//  Created by Paul Stefan Ort on 5/2/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "MainView.h"
#import "ThrobbingCircle.h"

@implementation MainView {
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor blackColor]];
        ThrobbingCircle *circle = [[ThrobbingCircle alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        [self addSubview:circle];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    ThrobbingCircle *circle = [[ThrobbingCircle alloc] initWithFrame:CGRectMake(point.x - 50, point.y - 50, 100, 100)];
    [self addSubview:circle];
    return self;
}

@end
