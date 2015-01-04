//
//  Draw.m
//  ShuaJian
//
//  Created by fuchaowen on 14-9-3.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "Draw.h"

@implementation Draw

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         pointArray1 = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)orthogon
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    if ([pointArray1 count]<=2)
    {
        CGRect rect=CGRectMake(firstPoint.x, firstPoint.y, (secondPoint.x-firstPoint.x), (secondPoint.y-firstPoint.y));
        CGContextStrokeRect(context, rect);
        NSValue * value=[NSValue valueWithCGRect:rect];
        NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:value,@"rct",nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"selrect" object:self userInfo:dict];
        
    }else if ([pointArray1 count]>2)
    {
        [pointArray1 removeObjectAtIndex:0];
        [pointArray1 removeObjectAtIndex:0];
    }
   
}
- (void)drawRect:(CGRect)rect
{
    [self orthogon];
  
   
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    firstPoint = point;
    [pointArray1 addObject:[NSValue valueWithCGPoint:firstPoint]];

}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    secondPoint = point;
    [self setNeedsDisplay];


}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    point = secondPoint;
    [pointArray1 addObject:[NSValue valueWithCGPoint:point]];
     [self setNeedsDisplay];
}
@end
