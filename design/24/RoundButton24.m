//
//  RoundButton.m
//  Mark Moeykens
//
//  Created by robert on 03.09.17.
//  Copyright (c) 2017 robert. All rights reserved.
//

#import "RoundButton24.h"

IB_DESIGNABLE
@interface RoundButton24 ()

@property (nonatomic) IBInspectable UIColor *ccolor;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end

@implementation RoundButton24


- (void)drawRect:(CGRect)rect {
    

    /*
    CALayer *
    layerr = [CALayer layer];
    layerr.frame = self.bounds;
    */

   
    
    // тень
    self.layer.shadowOffset 	= CGSizeMake(0,9); // смещение от центра
    self.layer.shadowOpacity 	= 0.15; 	// непрозрачность
    self.layer.shadowRadius 	= 5;	// уровень размытия
    self.layer.shadowColor 		=
    [ [UIColor colorWithRed: 0.0/255.0	green: 0.0/255.0 blue:0.0/255.0 alpha: 1.0        ] CGColor ];
    

    self.layer.borderColor = _borderColor.CGColor;
    self.layer.borderWidth  = _borderWidth;
    self.layer.cornerRadius = _cornerRadius;
    self.layer.backgroundColor  = _ccolor.CGColor;
    //[self.layer addSublayer:layerr];
    


    
}


- (void)methodTransform {
    self.transform = CGAffineTransformMakeScale(0.7 ,0.7);
    
    [UIView animateWithDuration: 0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity: 6
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations: ^(void) {  self.transform = CGAffineTransformIdentity; }
                     completion: ^(BOOL finished) {}
     ];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch
                     withEvent:(UIEvent *)event{
 
   
    
    self.layer.backgroundColor  =
    [[self color: [UIColor colorWithCGColor:self.layer.backgroundColor]
          withAlpha: 0.3] CGColor];
    
    NSLog(@" !!!2 "); return 1;
}
- (BOOL)continueTrackingWithTouch:(UITouch *)touch
                        withEvent:(nullable UIEvent *)event {

    
    CGPoint point1 = [ touch locationInView: self];
    
    NSLog(@"  %f %f  ",
          point1.x,point1.y
          );
    return 1;
}
- (void)endTrackingWithTouch:(nullable UITouch *)touch
                   withEvent:(nullable UIEvent *)event {
    
    self.layer.backgroundColor  =
    [[self color: [UIColor colorWithCGColor:self.layer.backgroundColor]
       withAlpha: 1] CGColor];
    
    NSLog(@" !!!4 ");
}


- (UIColor *)color:(UIColor *)color withAlpha:(CGFloat)alpha {
    CGFloat red, green, blue;
    if ([color getRed:&red green:&green blue:&blue alpha:NULL]) {
        return [UIColor colorWithRed:red
                               green:green
                                blue:blue
                               alpha:alpha];
    }
    return color;
}

@end
