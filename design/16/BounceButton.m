


#import "BounceButton.h"

@implementation BounceButton

- (void)touchesBegan:(NSSet  *)touches
           withEvent:(UIEvent *)event {

    self.transform = CGAffineTransformMakeScale(0.7 ,0.7);
    
    [UIView animateWithDuration: 0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity: 6
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations: ^(void) {  self.transform = CGAffineTransformIdentity; }
                     completion: ^(BOOL finished) {}
     ];
    [super touchesBegan:touches withEvent:event];
}

@end
