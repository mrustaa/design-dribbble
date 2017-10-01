//
//  RoundButton.m
//  Mark Moeykens
//
//  Created by robert on 03.09.17.
//  Copyright (c) 2017 robert. All rights reserved.
//

#import "RoundButton23.h"

IB_DESIGNABLE
@interface RoundButton23 ()

@property (nonatomic) IBInspectable BOOL кнопка;

@property (nonatomic) IBInspectable BOOL тень;
@property (nonatomic) IBInspectable CGFloat  радиус;
@property (nonatomic) IBInspectable CGFloat непрозрачность;
@property (nonatomic) IBInspectable CGPoint смещение;

@property (nonatomic) IBInspectable UIColor *ccolor;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end

@implementation RoundButton23


- (void)drawRect:(CGRect)rect {
    

    /*
    CALayer *
    layerr = [CALayer layer];
    layerr.frame = self.bounds;
    */

    if (self.тень) {
    
    // тень
    self.layer.shadowOffset 	= CGSizeMake(self.смещение.x,self.смещение.y); // смещение от центра
    self.layer.shadowOpacity 	= self.непрозрачность; 	// непрозрачность
    self.layer.shadowRadius 	= self.радиус;	// уровень размытия
    self.layer.shadowColor 		=
    [ [UIColor colorWithRed: 0.0/255.0	green: 0.0/255.0 blue:0.0/255.0 alpha: 1.0        ] CGColor ];
    
    }
    
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

    if(self.кнопка)
         self.layer.backgroundColor  =
         [[self color: [UIColor colorWithCGColor:self.layer.backgroundColor]
            withAlpha: 0.5] CGColor];
 
    return 1;
}
- (BOOL)continueTrackingWithTouch:(UITouch *)touch
                        withEvent:(nullable UIEvent *)event {

    //CGPoint point1 = [ touch locationInView: self];   NSLog(@"  %f %f  ",   point1.x,point1.y  );
    return 1;
}
- (void)endTrackingWithTouch:(nullable UITouch *)touch
                   withEvent:(nullable UIEvent *)event {
    
    if(self.кнопка)
        self.layer.backgroundColor  =
        [[self color: [UIColor colorWithCGColor:self.layer.backgroundColor]
           withAlpha: 1] CGColor];
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


























