



#import "GradientView.h"





IB_DESIGNABLE
@interface GradientView ()


@property (nonatomic) IBInspectable NSUInteger radius;
@property (nonatomic) IBInspectable NSUInteger borderWidth;


@property (nonatomic) IBInspectable UIColor *radiusColor;

@property (nonatomic) IBInspectable UIColor *gradientColor1;
@property (nonatomic) IBInspectable UIColor *gradientColor2;
@property (nonatomic) IBInspectable UIColor *gradientColor3;
@property (nonatomic) IBInspectable UIColor *gradientColor4;

@property (nonatomic) IBInspectable CGFloat opacity;



@end
@implementation GradientView

- (void)drawRect:(CGRect)rect {
    
    CALayer *
    layerr = [CALayer layer];
    int g=20;
    layerr.frame = CGRectMake
    ( self.bounds.origin.x+g, self.bounds.origin.y+g, self.bounds.size.width-(g*2), self.bounds.size.height-(g*2));
    
    // layerr.backgroundColor = [UIColor grayColor].CGColor;
    
    
    // тень
    layerr.shadowOffset 	= CGSizeMake(0, 10);  					// смещение от центра
    layerr.shadowOpacity 	= 0.7; 								// непрозрачность
    layerr.shadowRadius 	= 5;									// уровень размытия
    layerr.shadowColor 		= [ [UIColor colorWithRed: 44.0/255.0	//  цвет тени
                                                 green: 62.0/255.0
                                                  blue: 80.0/255.0
                                                 alpha: 1.0        ] CGColor ];
    
    
    
    
    layerr.cornerRadius = _radius;
    layerr.borderColor = self.radiusColor.CGColor; // 1 цвет
    layerr.borderWidth = _borderWidth; // 2 толщина

    
    CAGradientLayer *
    gradientLayer = [CAGradientLayer layer] ;
    gradientLayer.frame = layerr.bounds;
   gradientLayer.cornerRadius = _radius;
    gradientLayer.opacity = _opacity;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[self.gradientColor1 CGColor],(id)[self.gradientColor2 CGColor],(id)[self.gradientColor3 CGColor],(id)[self.gradientColor4 CGColor],nil];
    [self.layer addSublayer:gradientLayer];
   
    
    [self.layer addSublayer:layerr];
    
    


    
}

@end
