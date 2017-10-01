


#import "View15.h"



@interface View15 ()


@end

@implementation View15

- (void)drawRect:(CGRect)rect {
    

    CALayer *
    layerr = [CALayer layer];
    layerr.frame = self.bounds;
    layerr.backgroundColor = _color.CGColor;
    

    layerr.cornerRadius = _radius;

    [self.layer addSublayer:layerr];
    
}

- (void)setBackgroundColor2:(UIColor *)backgroundColor {

    for( CALayer *obj in self.layer.sublayers ) {
        obj.backgroundColor = backgroundColor.CGColor;
    }
}


@end
