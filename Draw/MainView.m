//
//  MainView.m
//  Draw
//
//  Created by Paul Stefan Ort on 5/2/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "MainView.h"

@implementation MainView {
    int circleX;
    int circleY;
    int circleSize;
    int smallestCircleSize;
    int biggestCircleSize;
    int circleInterval;
    CGFloat drawDelay;
    NSString *direction;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        smallestCircleSize = 15;
        biggestCircleSize = 100;
        circleInterval = 2;
        
        drawDelay = 0.01;
        
        circleX = 100;
        circleY = 100;
        circleSize = 15;
        direction = @"bigger";
        
        [self performSelector:@selector(update) withObject:nil afterDelay:drawDelay];
    }
    return self;
}

- (void)update {
    if ([direction isEqualToString:@"bigger"]) {
        circleSize += circleInterval;
        if (circleSize >= biggestCircleSize) {
            direction = @"smaller";
        }
    } else if ([direction isEqualToString:@"smaller"]) {
        circleSize -= circleInterval;
        if (circleSize <= smallestCircleSize) {
            direction = @"bigger";
        }
    }
    [self setNeedsDisplay];
    [self performSelector:@selector(update) withObject:nil afterDelay:drawDelay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self setBackgroundColor:[UIColor blackColor]];
    
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(circleX - (circleSize / 2), circleY - (circleSize / 2), circleSize, circleSize)];
    [fillColor setFill];
    [ovalPath fill];
    [strokeColor setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    circleX = point.x;
    circleY = point.y;
    return self;
}

@end
