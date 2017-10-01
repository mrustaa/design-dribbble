


#import "ViewController19.h"

@interface ViewController19 ()


@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet UIView *bgImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *yourFoodLabel;
@property (strong, nonatomic) IBOutlet UILabel *yourRatingLabel;

@property (strong, nonatomic) IBOutlet UIView *GoButtonView;
@property (strong, nonatomic) IBOutlet UIButton *GoButton;
@property (strong, nonatomic) IBOutlet UILabel *findLabel;
@property (strong, nonatomic) IBOutlet UILabel *yourLabel;
@property (strong, nonatomic) IBOutlet UILabel *foodLabel;

@property (strong, nonatomic) IBOutlet UIVisualEffectView *visual;

@end

@implementation ViewController19
- (IBAction)buckbutton:(id)sender { [self.presentingViewController dismissViewControllerAnimated: YES completion: NULL ]; }



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buckbutton:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"text-list-7.png"] forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    button.alpha = 0;
    button.frame = CGRectMake(15.0, 25.0, 30.0, 30.0);
    [self.view addSubview:button];
    
    
    self.navigationItem.title = @"Tasle";
    
    self.bgImage        .alpha  = 0;
    self.titleLabel     .alpha  = 0;
    self.yourFoodLabel  .alpha  = 0;
    self.yourRatingLabel.alpha  = 0;
    self.GoButtonView   .alpha  = 0;
    self.GoButton       .alpha  = 0;
    self.findLabel      .alpha  = 0;
    self.yourLabel      .alpha  = 0;
    self.foodLabel      .alpha  = 0;
    
    
    
    [UIView animateWithDuration: 3
                     animations: ^(void) {
                         button.alpha = 1;
                         self.bgImageView         .alpha  = 0;
                         self.bgImage        .alpha  = 1;

                     }
                     completion: ^(BOOL finished) { } ];
    
    [UIView animateWithDuration: 1
                     animations: ^(void) { }
                     completion: ^(BOOL finished) { [self showTitle]; } ];
    

    
}

- (void)showTitle {
    [UIView animateWithDuration: 1
                     animations: ^(void) {
                         self.titleLabel     .alpha  = 1;
                     }
                     completion: ^(BOOL finished) { [self showDesc]; } ];
}
- (void)showDesc {
    [UIView animateWithDuration: 1
                     animations: ^(void) {
                         self.yourFoodLabel  .alpha  = 1;
                         self.yourRatingLabel.alpha  = 1;
                     }
                     completion: ^(BOOL finished) { [self showButtonAndText]; } ];
}
- (void)showButtonAndText {
    [UIView animateWithDuration: 1
                     animations: ^(void) {
                         self.bgImage        .alpha  = 1;
                         self.GoButtonView   .alpha  = 1;
                         self.GoButton       .alpha  = 1;
                         self.findLabel      .alpha  = 1;
                         self.yourLabel      .alpha  = 1;
                         self.foodLabel      .alpha  = 1;
                     }
                     completion: ^(BOOL finished) {  } ];
}


- (void)viewWillAppear:(BOOL)animated {
    [ self.navigationController setNavigationBarHidden: YES  animated: YES ];
}

@end
