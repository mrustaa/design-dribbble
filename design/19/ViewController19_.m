

//#define DEGREES_TO_RADIANS(degree) (M_PI * (degree) / 180.0)
#import "ViewController19_.h"

@interface ViewController19_ ()

@property (strong, nonatomic) IBOutlet UIView *foodView;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImage;

@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic) IBOutlet UIView *darkFillView;
@property (strong, nonatomic) IBOutlet UIButton *toggleMenuButton;

@property (strong, nonatomic) IBOutlet UIView *roundButton1;
@property (strong, nonatomic) IBOutlet UIView *roundButton2;
@property (strong, nonatomic) IBOutlet UIView *roundButton3;
@property (strong, nonatomic) IBOutlet UIView *roundButton4;

@end

@implementation ViewController19_

- (IBAction)buckbutton:(id)sender { [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ]; }



- (IBAction)toggleMenuAction:(id)sender {
    
    NSLog(@"%@",_toggleMenuButton.imageView);

    if (CGAffineTransformEqualToTransform( self.darkFillView.transform , CGAffineTransformIdentity) ) {
    
        
        
        [UIView animateWithDuration: 1
                         animations: ^(void)
        {
            self.darkFillView.transform = CGAffineTransformMakeScale(11 ,11);
            self.toggleMenuButton.imageView.transform = CGAffineTransformMakeRotation((M_PI_2 * 2));
            self.menuView.transform =  CGAffineTransformMakeTranslation(0,-47);
            
        }
                         completion: ^(BOOL finished)
        {
            [UIView animateWithDuration: 1
                             animations: ^(void) { [self toggleSharedButton]; }];
             
        } ];
    }
    else {
        
        
        [UIView animateWithDuration: 1
                         animations: ^(void)
        {
            self.darkFillView.transform = CGAffineTransformIdentity;
            self.toggleMenuButton.imageView.transform =  CGAffineTransformIdentity;
            self.menuView.transform =   CGAffineTransformIdentity;
            [self toggleSharedButton];
        }
                         completion: ^(BOOL finished) {  } ];
        
        
    }
    
}
- (void)toggleSharedButton {
    bool i = (_roundButton1.alpha ? 0 : 1 );
    
    _roundButton1.alpha =i;
    _roundButton2.alpha =i;
    _roundButton3.alpha =i;
    _roundButton4.alpha =i;

}

- (void)viewDidLoad {
    
    // постоянное движение пальцем ------------------------------------------------------------------
    [ self.view addGestureRecognizer:[ [UIPanGestureRecognizer alloc] initWithTarget: self action: @selector(method_pan: )] ];
    
    divisor = (self.view.frame.size.width / 2) / 0.61;
    центральная_позиция = _foodView.center;
    _thumbImage.alpha = 0;
    
    
    [super viewDidLoad];
    _roundButton1.alpha =0;
    _roundButton2.alpha =0;
    _roundButton3.alpha =0;
    _roundButton4.alpha =0;
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    

    [self.navigationController.navigationBar
     setBackgroundImage: [UIImage imageNamed:@"NavigationAlpha"]
     forBarMetrics:UIBarMetricsDefault];
    

    
}
CGFloat divisor;
CGPoint центральная_позиция;
CGPoint точка_нажатия;
- (IBAction)method_pan: (UIPanGestureRecognizer *)sender {
    
    CGPoint  смещение_от_точки_нажатия   = [ sender translationInView: self.view ];
    
    CGFloat палец_вверх;
    
    if (sender.state == UIGestureRecognizerStateBegan   ) { 
        точка_нажатия = _foodView.center;
    }
    else if ( sender.state == UIGestureRecognizerStateChanged ) {
    
        
        
        палец_вверх = _foodView.center.x  - центральная_позиция.x ;
        
        CGPoint position3 = CGPointMake(    ( центральная_позиция.x  +  смещение_от_точки_нажатия.x ),
                                            ( центральная_позиция.y  +  смещение_от_точки_нажатия.y ));
        
        
        _thumbImage.alpha = abs(палец_вверх) / центральная_позиция.x ;
        
        _foodView.center = position3;
        
        float i = abs(палец_вверх);

         _foodView.transform = CGAffineTransformMakeRotation(( палец_вверх/divisor ));
        _foodView.transform = CGAffineTransformScale(_foodView.transform,
                                                     MIN( 100 / ( i ? i : 1 ) , 1.) ,MIN( 100 / ( i ? i : 1 ) , 1. ) );
        
        if (палец_вверх > 0) {

            _thumbImage.image = [UIImage imageNamed:@"thumbUp"];
            _thumbImage.tintColor = [UIColor greenColor];
        }
        else {
            
            _thumbImage.image = [UIImage imageNamed:@"thumbDown"];
            _thumbImage.tintColor = [UIColor redColor];
        }
        
    }
    else if ( sender.state == UIGestureRecognizerStateEnded   ) { NSLog(@"!");
        NSLog(@" %f " ,  _foodView.center.x
              );
        if ( _foodView.center.x   < 45) {
            [UIView animateWithDuration: 0.3
                             animations: ^(void) {
                 NSLog(@"!1 %f  " ,   _foodView.center.x );
                 _foodView.center = CGPointMake( центральная_позиция.x - 400,  _foodView.center.y ) ;
                 _foodView.alpha = 0;
                             }               completion: ^(BOOL finished)
             { [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reset:) userInfo:0 repeats:0];
                             
                             } ]; return;
        } else if ( _foodView.center.x > (self.view.frame.size.width - 45)) {
            [UIView animateWithDuration: 0.3
                             animations: ^(void) {
                 NSLog(@"!2 %f %f " ,   _foodView.center.x, self.view.frame.size.width - 75 );
                 _foodView.center = CGPointMake( центральная_позиция.x + 400,  _foodView.center.y ) ;
                 _foodView.alpha = 0;
                             }               completion: ^(BOOL finished)
            {[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reset:) userInfo:0 repeats:0];
                             } ]; return;
        }
        
        [UIView animateWithDuration: 0.2
                         animations: ^(void)
        {
            _foodView.center = центральная_позиция;
            _thumbImage.alpha = 0;
            _foodView.transform = CGAffineTransformIdentity;
            
        }
                         completion: ^(BOOL finished) {  } ];
        
    }
  
}

- (IBAction)reset:(id)sender {
    [UIView animateWithDuration: 0.2
                     animations: ^(void)
    {   _foodView.center = центральная_позиция;
        _foodView.alpha = 1;
        _foodView.transform = CGAffineTransformIdentity;
        _thumbImage.alpha = 0;
    } completion: ^(BOOL finished) {  } ];
}
- (void)viewDidAppear:	  (BOOL)animated {
    [ self.navigationController setNavigationBarHidden: NO  animated: YES ];
}



@end
