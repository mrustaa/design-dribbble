



#import "ViewController12.h"

@interface ViewController12 ()

@end

@implementation ViewController12
- (IBAction)buckbutton:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated: YES
                                                      completion: NULL ];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self
               action:@selector(buckbutton:)
     forControlEvents:UIControlEventTouchUpInside];
    [ button setBackgroundImage:[ UIImage imageNamed:@"text-list-7"] forState:UIControlStateNormal];
    button.frame = CGRectMake(15.0, 25.0, 30.0, 30.0);
    [self.view addSubview:button];
    
}



@end
