//
//  ThrobbingCircle.m
//  Draw
//
//  Created by Paul Stefan Ort on 5/4/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "ThrobbingCircle.h"

@implementation ThrobbingCircle {
    int circleX;
    int circleY;
    int circleSize;
    int smallestCircleSize;
    int biggestCircleSize;
    int circleInterval;
    CGFloat drawDelay;
    NSString *direction;
    NSArray *colors;
    UIColor *fillColor;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        colors = @[
                   [UIColor redColor],
                   [UIColor orangeColor],
                   [UIColor yellowColor],
                   [UIColor blueColor],
                   [UIColor greenColor],
                   [UIColor grayColor],
                   ];
        
        uint32_t randomColor = arc4random_uniform([colors count]);
        fillColor = [colors objectAtIndex:randomColor];
        
        smallestCircleSize = 15;
        biggestCircleSize = 100;
        circleInterval = 2;
        
        drawDelay = 0.01;
        
        circleX = frame.size.width / 2;
        circleY = frame.size.height / 2;
        circleSize = 15;
        direction = @"bigger";
        
        [self setBackgroundColor:[UIColor clearColor]];
        
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
    [self performSelector:@selector(update) withObject:nil afterDelay:drawDelay];
}

- (void)drawRect:(CGRect)rect
{
    [self setBackgroundColor:[UIColor clearColor]];
    
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(circleX - (circleSize / 2), circleY - (circleSize / 2), circleSize, circleSize)];
    [fillColor setFill];
    [ovalPath fill];
    [strokeColor setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];
}

@end
