//
//  gradientView.m
//  app1
//
//  Created by Admin on 11.09.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "gradientView23.h"



IB_DESIGNABLE
@interface gradientView23 ()

@property (nonatomic) IBInspectable BOOL linear_radial;
@property (nonatomic) IBInspectable BOOL bla1;

@property (nonatomic) IBInspectable CGPoint bla2;
@property (nonatomic) IBInspectable CGPoint bla3;


@property (nonatomic) IBInspectable UIColor *gradientColor1;
@property (nonatomic) IBInspectable UIColor *gradientColor2;
@property (nonatomic) IBInspectable UIColor *gradientColor3;
@property (nonatomic) IBInspectable UIColor *gradientColor4;

@end


@implementation gradientView23



-(void)gradientRadial {
    
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), [_gradientColor4 CGColor]);
    CGContextFillRect ( UIGraphicsGetCurrentContext() , self.frame );
    
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[_gradientColor1 CGColor],
                       //(id)[_gradientColor2 CGColor],
                       //(id)[_gradientColor3 CGColor],
                       (id)[_gradientColor4 CGColor],
                       nil];
    
    CGContextDrawRadialGradient(
         UIGraphicsGetCurrentContext(),
         CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(),
(CFArrayRef) colors , nil),
         _bla2,
         0,
         _bla2,
         _bla3.y ,
         kCGGradientDrawsBeforeStartLocation);
    
    
    
    if (_bla1) {
        
        CALayer *
        layerr3 = [CALayer layer];
        layerr3.frame = CGRectMake( _bla2.x-5, _bla2.y-5, 10, 10);
        layerr3.backgroundColor = [UIColor blackColor].CGColor;
        layerr3.cornerRadius 	= 5;
        [self.layer addSublayer:layerr3];
        // ____________________________________________________________________________________
        CALayer *
        layerr2 = [CALayer layer];
        layerr2.frame = CGRectMake
        ( _bla2.x  - _bla3.y ,
         _bla2.y- _bla3.y,
         _bla3.y*2,
         _bla3.y*2);

        // границы
        layerr2.borderColor = [[UIColor blackColor] CGColor];  		// 1 цвет
        layerr2.borderWidth = 1; 									// 2 толщина
        
       // layerr2.backgroundColor =
       // [UIColor colorWithRed: 0.0/255.0 green: 0.0/255.0 blue: 0.0/255.0 alpha:  .25].CGColor;
        layerr2.cornerRadius = _bla3.y;
        [self.layer addSublayer:layerr2];
        // ____________________________________________________________________________________
        
    }

    
    
}


-(void)gradientLinear {
    
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[_gradientColor1 CGColor],
                       //(id)[_gradientColor2 CGColor],
                       //(id)[_gradientColor3 CGColor],
                       (id)[_gradientColor4 CGColor],
                       nil];
    
    CGGradientRef myGradient =
    CGGradientCreateWithColors( CGColorSpaceCreateDeviceRGB(), (CFArrayRef) colors, nil);
    
    
     CGContextDrawLinearGradient(context     ,
     myGradient  ,
     _bla2       ,
     _bla3       ,
     0           );
    
    if (_bla1) {
        
        CALayer *
        layerr3 = [CALayer layer];
        layerr3.frame = CGRectMake( _bla2.x-5, _bla2.y-5, 10, 10);
        layerr3.backgroundColor = [UIColor blackColor].CGColor;
        layerr3.cornerRadius 	= 5;
        [self.layer addSublayer:layerr3];
        // ____________________________________________________________________________________
        CALayer *
        layerr2 = [CALayer layer];
        layerr2.frame = CGRectMake( _bla3.x-5, _bla3.y-5, 10, 10);
        layerr2.backgroundColor = [[UIColor blackColor] CGColor];
        layerr2.cornerRadius = 5;
        [self.layer addSublayer:layerr2];
        // ____________________________________________________________________________________
        
    }

    
}


- (void)drawRect:(CGRect)rect {

    NSDate *start = [NSDate date];
    // code...


    if (self.linear_radial) [self gradientLinear];
    else [self gradientRadial];
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:start];
    NSLog(@"Execution Time: %f", executionTime);

    


    

}



@end




















