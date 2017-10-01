
#import "OORadialGradientView.h"

IB_DESIGNABLE
@interface OORadialGradientView ()



@property (nonatomic) IBInspectable UIColor *gradientColor1;
@property (nonatomic) IBInspectable UIColor *gradientColor2;
@property (nonatomic) IBInspectable UIColor *gradientColor3;
@property (nonatomic) IBInspectable UIColor *gradientColor4;

@end


@implementation OORadialGradientView



- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    

    NSArray *colors = [NSArray arrayWithObjects:(id)[_gradientColor1 CGColor], (id)[_gradientColor2 CGColor],(id)[_gradientColor3 CGColor], (id)[_gradientColor4 CGColor], nil];
    
    CGColorSpaceRef myColorspace=CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef myGradient = CGGradientCreateWithColors(myColorspace, (CFArrayRef) colors, nil);
    
    double circleWidth = self.viewForBaselineLayout.frame.size.width;
    double circleHeight = self.viewForBaselineLayout.frame.size.height;
    
    CGPoint theCenter = CGPointMake(circleWidth/2, circleHeight/2);
    

    double radius = circleHeight;
    
    if (circleHeight < circleWidth) {
        radius = circleWidth;
    }
    
    CGGradientDrawingOptions options = kCGGradientDrawsBeforeStartLocation;
    CGContextDrawRadialGradient(context, myGradient, theCenter, 0.0, theCenter, radius/1.3, options);
}


@end
