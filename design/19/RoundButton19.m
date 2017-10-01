


#import "RoundButton19.h"

IB_DESIGNABLE
@interface RoundButton19 ()

@property (nonatomic) IBInspectable UIColor *ccolor;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end

@implementation RoundButton19


- (void)drawRect:(CGRect)rect {
    

    self.layer.frame =  self.frame;
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.borderWidth  = _borderWidth;
    self.layer.cornerRadius = _cornerRadius;
    self.layer.backgroundColor  = _ccolor.CGColor;

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
