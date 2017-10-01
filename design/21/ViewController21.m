


#import "ViewController21.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController21 ()

@property (strong, nonatomic) IBOutlet UIImageView *ball2;
@property (strong, nonatomic) IBOutlet UIImageView *ball;
@property (strong, nonatomic) IBOutlet UIImageView *dribb;
@property (strong, nonatomic) IBOutlet UIImageView *b;
@property (strong, nonatomic) IBOutlet UIImageView *le;
@property (strong, nonatomic) IBOutlet UIImageView *hello;
@property (strong, nonatomic) IBOutlet UIImageView *ee;
@property (strong, nonatomic) IBOutlet UIImageView *oo;

@property (strong, nonatomic) UIImageView *dribb2;
@property (strong, nonatomic) UIImageView *b2;
@property (strong, nonatomic) UIImageView *le2;
@property (strong, nonatomic) UIImageView *hello2;
@property (strong, nonatomic) UIImageView *ee2;
@property (strong, nonatomic) UIImageView *oo2;

@property (strong, nonatomic) UIView *animation;

@property (strong, nonatomic)  CAEmitterLayer *confettiLayer;

@end

@implementation ViewController21


- (UIImage *)overlayImage:(UIImage *)image
                withColor:(UIColor *)color {
    
    //  Create rect to fit the PNG image
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    //  Start drawing
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    //  Fill the rect by the final color
    [color setFill];
    CGContextFillRect(context, rect);
    
    //  Make the final shape by masking the drawn color with the images alpha values
    CGContextSetBlendMode(context, kCGBlendModeDestinationIn);
    [image drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1];
    
    //  Create new image from the context
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    //  Release context
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)viewDidLoad {    [super viewDidLoad];
    

    
    UIImageView *
    ballImage = [[UIImageView alloc] initWithFrame: _ball2.frame ]; //  CGRectMake(-61,43,558,527)];
    ballImage.contentMode =  UIViewContentModeScaleAspectFit;
    ballImage.image = [self overlayImage: [UIImage imageNamed:@"ball2"] withColor:
    [UIColor colorWithRed: 192.0/255.0 green: 39.0/255.0 blue: 99.0/255.0 alpha: 1.0] ];
   // ballImage.tintColor = [UIColor colorWithRed: 192.0/255.0 green: 39.0/255.0 blue: 99.0/255.0 alpha: 1.0];
    [self.view addSubview:ballImage];
    

    self.dribb2 = [[UIImageView alloc] initWithFrame: _dribb.frame];
    self.dribb2.contentMode =  UIViewContentModeScaleAspectFit;
    self.dribb2.image = [self overlayImage:[UIImage imageNamed:@"dribb"] withColor: [UIColor whiteColor]];
    [self.view addSubview:self.dribb2];
    

    _b2 = [[UIImageView alloc] initWithFrame: _b.frame ];
    _b2.contentMode =  UIViewContentModeScaleAspectFit; //bbb
    _b2.image = [self overlayImage:[UIImage imageNamed:@"bbb"] withColor: [UIColor whiteColor]];
    [self.view addSubview:_b2];
    

    _le2 = [[UIImageView alloc] initWithFrame: _le.frame];
    _le2.contentMode =  UIViewContentModeScaleAspectFit; // leeee
    _le2.image = [self overlayImage:[UIImage imageNamed:@"leeee"] withColor: [UIColor whiteColor]];
    [self.view addSubview:_le2];
    
    
    
    self.hello2 = [[UIImageView alloc] initWithFrame: _hello.frame];
    self.hello2.contentMode =  UIViewContentModeScaleAspectFit;
    self.hello2.image = [self overlayImage:[UIImage imageNamed:@"hello3"] withColor: [UIColor whiteColor]];
    [self.view addSubview:self.hello2];
    
    
    _ee2 = [[UIImageView alloc] initWithFrame: _ee.frame ];
    _ee2.contentMode =  UIViewContentModeScaleAspectFit; //bbb
    _ee2.image = [self overlayImage:[UIImage imageNamed:@"hello4"] withColor: [UIColor whiteColor]];
    [self.view addSubview:_ee2];
    
    
    _oo2 = [[UIImageView alloc] initWithFrame: _oo.frame];
    _oo2.contentMode =  UIViewContentModeScaleAspectFit; // leeee
    _oo2.image = [self overlayImage:[UIImage imageNamed:@"hello5"] withColor: [UIColor whiteColor]];
    [self.view addSubview:_oo2];
    
           _animation = [UIView new];
        _animation.frame = CGRectMake(0,0,320,480); // 0> 0v  >> vv
        _animation.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        [self.view addSubview:_animation ];
    
        self.animation.alpha = 0;
    
    UIButton *
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buckbutton:) forControlEvents:UIControlEventTouchUpInside];
    //[button setBackgroundImage:[ UIImage imageNamed:@"text-list-7"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"text-list-7.png"] forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    button.alpha = 1;
    button.frame = CGRectMake(15.0, 25.0, 30.0, 30.0);
    NSLog(@"%@",button);
    [self.view addSubview:button];

    UIButton *
    button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 addTarget:self action:@selector(buckbutton2:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle: @"Thanks, restart!" forState:UIControlStateNormal];
     button2.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.f];
    [button2 setTintColor:[UIColor whiteColor]];
    button2.alpha = 1;
    button2.frame = CGRectMake(0.0, self.view.frame.size.height-65, self.view.frame.size.width , 30.0);
    [self.view addSubview:button2];
    NSLog(@"%@",button2);
    
    [self showDribbbleBalls];
    
    
    int xOffset = _b2.frame.size.width / 2;
    int y = -( _b2.frame.origin.y + _b2.frame.size.height + 50 );
    
    
    _dribb .transform = CGAffineTransformMakeTranslation(0,-47);
    _b2    .transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(0, y ),0.7,2);
    _le2   .transform = CGAffineTransformMakeTranslation( -xOffset -19 ,0);
}
-(void)viewDidAppear:(BOOL)animated { [super viewWillAppear:   animated];
    
    [UIView animateWithDuration: 0.4
                          delay: 2
         usingSpringWithDamping: 0.5
          initialSpringVelocity: 0
                        options: 0
                     animations: ^(void) {
                         _dribb2 .transform = CGAffineTransformMakeScale(0.8,1.2);
                         _le2    .transform = CGAffineTransformMakeScale(1., 1.2);
                         NSLog(@"разделить Dribble");
                     }
                     completion: ^(BOOL finished) {  [self showB];
                     }];
    
}

- (IBAction)buckbutton:(id)sender {[self.presentingViewController dismissViewControllerAnimated:1 completion:0 ];}
- (IBAction)buckbutton2:(id)sender {
    [UIView animateWithDuration: 0.2
                     animations: ^(void) {
    [self setStartPositions];
                     }];

}
- (void)setStartPositions {
    

    
    int xOffset = _b2.frame.size.width / 2;
    int y = -( _b2.frame.origin.y + _b2.frame.size.height + 50 );
    
    
    _dribb .transform = CGAffineTransformMakeTranslation(0,-47);
    _b2    .transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(0, y ),0.7,2);
    _le2   .transform = CGAffineTransformMakeTranslation( -xOffset -27 ,0);
    NSLog(@"стартовая позиция");
 

    [self separateDribble];

}
- (void)separateDribble {
    
    [UIView animateWithDuration: 0.4
                          delay: 2
         usingSpringWithDamping: 0.5
          initialSpringVelocity: 0
                        options: 0
                     animations: ^(void) {
                         _dribb2 .transform = CGAffineTransformMakeScale(0.8,1.2);
                         _le2    .transform = CGAffineTransformMakeScale(0.8,1.2);
                         NSLog(@"разделить Dribble");
                     }
                     completion: ^(BOOL finished) {  [self showB];
                     }];
}
- (void)showB {
    [UIView animateWithDuration: 1
                          delay: 0
         usingSpringWithDamping: 0.4
          initialSpringVelocity: -10
                        options: UIViewAnimationOptionCurveEaseOut
                     animations: ^(void) {
                         _b2    .transform = CGAffineTransformIdentity;
                         NSLog(@"покзаать B");
                     }
                     completion: ^(BOOL finished) { [self connectDribble ]; }];
}
- (void)connectDribble {
    [UIView animateWithDuration: 0.4
                          delay: 0
         usingSpringWithDamping: 0.5
          initialSpringVelocity: 0
                        options: 0
                     animations: ^(void) {
                         _dribb2 .transform = CGAffineTransformIdentity;
                         _le2    .transform = CGAffineTransformIdentity;
                         NSLog(@"склеить Dribble");
                     }
                     completion: ^(BOOL finished) { [self winkHello ]; }];
}
- (void)winkHello {
    [UIView animateWithDuration: 0.2
                     animations: ^(void) {
                         self.ee2.transform = CGAffineTransformMakeScale(1,0.2);
                         self.oo2.transform = CGAffineTransformMakeScale(1,0.2);
                         NSLog(@"закрыть глаза hello");
                     }
                     completion: ^(BOOL finished)
    {
        [UIView animateWithDuration: 0.2
                         animations: ^(void) {
                             self.ee2.transform = CGAffineTransformIdentity;
                             self.oo2.transform = CGAffineTransformIdentity;
                             NSLog(@"открыть глаза hello");
                         }
                         completion: ^(BOOL finished) {
                         }];
                     }];
}
- (void)showDribbbleBalls {


    
    CAEmitterLayer *
    emitter = [CAEmitterLayer layer];
    emitter.emitterShape = kCAEmitterLayerLine;

    
    CAEmitterCell *
    cell = [CAEmitterCell emitterCell];
    cell.contents = (id)([UIImage imageNamed:@"ballsmall4"]).CGImage;

    cell.birthRate = 1;
    cell.lifetime = 50;
    cell.velocity = 25.f;
    cell.emissionLongitude = (180 * (M_PI/180));
    cell.emissionRange = (45 * (M_PI/180) );
    cell.scale = 0.4;
    cell.scaleRange = 0.3;

    
    emitter.emitterCells =  [NSArray arrayWithObject:cell];
    emitter.emitterPosition = CGPointMake( self.view.frame.size.width / 2 , 50);
    emitter.emitterSize = CGSizeMake( self.view.frame.size.width, 2);
    
    
    

    CALayer *lla = [CALayer layer];
    lla.frame = CGRectMake(0, 0,([UIImage imageNamed:@"originalImage"]).size.width,
                           ([UIImage imageNamed:@"originalImage"]).size.height);
    lla.contents = (id)([UIImage imageNamed:@"originalImage"]).CGImage;

 

    [self.view.layer addSublayer: emitter];
    [self.animation.layer addSublayer: emitter];
    
    
    [UIView animateWithDuration: 5
                     animations: ^(void) {
                         self.animation.alpha = 1;
                     }
                     completion: ^(BOOL finished) { }];
    
    
    for ( id obj in self.view.subviews) {
        if ([[obj class] isEqual: [UIImageView class]]) {
        }
    }
 
}

-(UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }
- (BOOL)prefersStatusBarHidden { return  1;}
@end
