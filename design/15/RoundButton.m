



#import "RoundButton.h"

IB_DESIGNABLE
@interface RoundButton ()

@property (nonatomic) IBInspectable UIColor *ccolor;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end

@implementation RoundButton


- (void)drawRect:(CGRect)rect {
    
    

    
    
    CALayer *
    layerr = [CALayer layer];
    layerr.frame = self.bounds;
    layerr.borderColor = _borderColor.CGColor;
    layerr.borderWidth  = _borderWidth;
    layerr.cornerRadius = _cornerRadius;
    layerr.backgroundColor  = _ccolor.CGColor;
    [self.layer addSublayer:layerr];
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

@end
